require 'terminal-notifier' if RemindMeTo::OS.mac?

module RemindMeTo
  class Notifier
    class NotificationCenterNotifier
      def notify(message, opts = {})
        TerminalNotifier.notify('RemindMeTo', :title => message, :group => Process.pid)
      end
    end
  end
end
