module RemindMeTo
  class Runner
    def initialize(options)
      @options = options
      @notifier = RemindMeTo::Notifier.new
      @running = true
    end

    # The main run loop for displaying the notifications
    def run
      while(@running)
        sleep(@options[:interval])
        Libnotify.show(:summary => @options[:message], :body => "", :timeout => 2.5)
        @running = false unless @options[:repeat]
      end
    end
  end
end