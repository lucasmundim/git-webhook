require 'git-webhook/repository'

module GitWebhook
  class Builder

    attr_reader :data_hash

    def initialize(old, new, ref, repository_path, options = {})
      @repository = GitWebhook::Repository.new(repository_path, options)
      data = {
        :before => old,
        :after => new,
        :ref => ref,
        :commits => @repository.commits_between(old, new),
        :repository => @repository.info
      }
      data.delete :repository if data[:repository].empty?
      @data_hash = data
    end


  end
end
