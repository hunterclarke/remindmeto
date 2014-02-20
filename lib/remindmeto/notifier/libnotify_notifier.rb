require 'libnotify' if RemindMeTo::OS.linux?

module RemindMeTo
  class Notifier
    class LibnotifyNotifier
      def notify(message, opts = {})
        Libnotify.show(:body => 'RemindMeTo', :summary => message)
      end
    end
  end
end
