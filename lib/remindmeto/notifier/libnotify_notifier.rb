require 'libnotify' if RemindMeTo::OS.linux?

module RemindMeTo
  class Notifier
    class LibnotifyNotifier
      def notify(message, opts = {})
        title = 'RemindMeTo'
        Libnotify.show :body => message, :summary => opts[:header]
      end
    end
  end
end
