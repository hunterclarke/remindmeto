require 'terminal-notifier' if RemindMeTo::OS.mac?

module RemindMeTo
  class Notifier
    class NotificationCenterNotifier
      def notify(message, opts = {})
        title = 'RemindMeTo'

        TerminalNotifier.notify message, :title => title, :subtitle => opts[:header]
      end
    end

  end
end
