module RemindMeTo
  class CLI

    def initialize
      @options = {}
    end

    def run(args = ARGV)
      trap_interrupt

      @options = RemindMeTo::Normalizer.new(args).process
      RemindMeTo::Runner.new(@options).run
    end

    def trap_interrupt
      Signal.trap('INT') do
        exit!(1)
        $stderr.puts
        $stderr.puts 'Stopping remindmeto'
      end
    end
  end
end