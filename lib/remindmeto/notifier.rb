require 'remindmeto/notifier/notification_center_notifier'
require 'remindmeto/notifier/libnotify_notifier'

module RemindMeTo
  class Notifier
    def initialize()
      if RemindMeTo::OS.mac?
        @notifier = NotificationCenterNotifier.new
      else RemindMeTo::OS.linux?
        @notifier = LibnotifyNotifier.new
      end
    end

    def notify(message, opts = {})
      @notifier.notify(message, opts)
    end
  end
end
