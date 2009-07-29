require 'grit'

module GitWebhook

  class Repository

    def initialize(path, options = {})
      options.to_options!
      options.assert_valid_keys :url, :name, :description, :homepage, :watchers,
                                :forks, :private, :pledgie, :owner, :commit_url
      options[:owner].assert_valid_keys(:name, :email) unless options[:owner].nil?

      @repo = Grit::Repo.new(path)
      @options = options
    end

    def info
      @options.except(:commit_url)
    end

    def commits_between(old, new)
      commits = []
      @repo.commits_between(old, new).each do |commit|
        commit_data = {
          :id => commit.sha,
          :author => {
            :name => commit.author.name,
            :email => commit.author.email
          },
          :message => commit.message,
          :timestamp => commit.date.xmlschema
        }
        commit_data[:url] = @options[:commit_url] % commit.sha unless @options[:commit_url].blank?

        commit_data.merge! commit_stats(commit)

        commits << commit_data
      end
      commits
    end

    private

      def commit_stats(commit)
        stats = {}
        [:added, :removed, :modified].each do |key|
          stats[key] = []
        end

        commit.show.each do |file|
          case
          when added?(file)
            stats[:added] << file.a_path
          when removed?(file)
            stats[:removed] << file.a_path
          when modified?(file)
            stats[:modified] << file.a_path
          end
        end

        stats.delete_if {|key, value| value.nil? }
      end

      def added?(file)
        file.new_file == true and file.deleted_file == false
      end

      def removed?(file)
        file.new_file == false and file.deleted_file == true
      end

      def modified?(file)
        file.new_file == false and file.deleted_file == false
      end

      def render_stats(added, deleted, modified)
        stats = {}
        stats[:added] = added unless added.empty?
        stats[:deleted] = deleted unless deleted.empty?
        stats[:modified] = modified unless modified.empty?
        stats
      end

  end

end
