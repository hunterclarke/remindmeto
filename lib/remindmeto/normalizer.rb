module RemindMeTo
  class Normalizer
    def initialize(args)
      @args = args
      @single_interval_keywords = %w{in after}
      @rolling_interval_keywords = %w{every}
    end

    def process()
      @keyword_idx = split_by_interval_keyword

      options = {}
      options[:message] = get_message
      options[:interval] = get_interval
      options[:repeat] = get_repeat

      options
    end

    private

    def split_by_interval_keyword()
      keyword_idx = 0
      interval_keywords = [@single_interval_keywords, @rolling_interval_keywords].flatten
      interval_keywords.each do |word|
        idx = @args.rindex(word)
        keyword_idx = idx unless (idx == nil || idx < keyword_idx)
      end

      abort_with_usage_message if keyword_idx == 0
      keyword_idx
    end

    def get_message
      @args[0..@keyword_idx-1].join(' ')
    end

    def get_interval
      return 1 if @args.last.eql?('second')
      return 60 if @args.last.eql?('minute')
      return 3600 if @args.last.eql?('hour')

      multiplier = @args[-2].to_i
      abort_with_usage_message if multiplier == 0

      interval = multiplier if @args.include?('seconds')
      interval = 60 * multiplier if @args.include?('minutes')
      interval = 3600 * multiplier if @args.include?('hours')

      interval
    end

    def get_repeat
      if @single_interval_keywords.include?(@args[@keyword_idx])
        false
      else
        true
      end
    end

    def abort_with_usage_message
      abort("Usage: remindmeto { task } { every/in } { a(n)/time } { second(s)/minute(s)/hour(s) }")
    end

  end
end