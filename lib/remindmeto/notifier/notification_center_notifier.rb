require 'terminal-notifier' if RemindMeTo::OS.mac?

module RemindMeTo
  class Notifier
    class NotificationCenterNotifier
      def notify(message, opts = {})
        TerminalNotifier.notify(message)
      end
    end
  end
end
