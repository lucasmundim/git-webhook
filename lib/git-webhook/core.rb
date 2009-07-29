require 'git-webhook/notifier'
require 'git-webhook/builder'

module GitWebhook

  class Core

    def initialize(old, new, ref, repository_path, options = {})
      @data_hash = GitWebhook::Builder.new(old, new, ref, repository_path, options).data_hash
    end

    def notify(url)
      notifier = GitWebhook::Notifier.new(@data_hash)
      notifier.notify(url)
    end

  end
end
