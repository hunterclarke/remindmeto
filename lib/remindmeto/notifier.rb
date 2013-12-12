require 'remindmeto/notifier/growl_notifier'
require 'remindmeto/notifier/libnotify_notifier'
require 'remindmeto/notifier/notification_center_notifier'

module RemindMeTo
  class Notifier

    def initialize()
      if RemindMeTo::OS.has_notification_center?
        @notifier = RemindMeTo::Notifier::NotificationCenterNotifier.new
      elsif RemindMeTo::OS.mac?
        @notifier = RemindMeTo::Notifier::GrowlNotifier.new
      elsif RemindMeTo::OS.linux?
        @notifier = RemindMeTo::Notifier::LibnotifyNotifier.new
      end
    end

    def notify(message, opts = {})
      @notifier.notify(message, opts)
    end

  end
end
