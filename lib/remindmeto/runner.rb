module RemindMeTo
  class Runner
    def initialize(options)
      @options = options
      @notifier = Notifier.new
      @running = true
    end

    # The main run loop for displaying the notifications
    def run
      while(@running)
        sleep(@options[:interval])
        @notifier.notify(@options[:message], {})
        @running = false unless @options[:repeat]
      end
    end
  end
end