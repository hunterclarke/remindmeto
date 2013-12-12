module RemindMeTo
  module Normalizer
    module_function

    @@single_interval_keywords = %w{in after}
    @@rolling_interval_keywords = %w{every}

    def split_by_interval_keyword(args)
      keyword_idx = 0
      interval_keywords = [@@single_interval_keywords, @@rolling_interval_keywords].flatten
      interval_keywords.each do |word|
        idx = args.rindex(word)
        keyword_idx = idx unless (idx == nil || idx < keyword_idx)
      end

      abort_with_usage_message if keyword_idx == 0
      keyword_idx
    end

    def get_message(args, keyword_idx)
      args[0..keyword_idx-1].join(' ')
    end

    def get_interval(args)
      return 1 if args.include?('second')
      return 60 if args.include?('minute')
      return 3600 if args.include?('hour')

      multiplier = args[-2].to_i
      abort_with_usage_message if multiplier == 0

      interval = multiplier if args.include?('seconds')
      interval = 60*multiplier if args.include?('minutes')
      interval = 3600*multiplier if args.include?('hours')

      interval
    end

    def get_repeat(args, keyword_idx)
      if @@single_interval_keywords.include?(args[keyword_idx])
        repeat = false
      else
        repeat = true
      end

      repeat
    end

    def abort_with_usage_message
      abort("Usage: remindmeto { task } { every/in } { a(n)/time } { second(s)/minute(s)/hour(s) }")
    end

  end
end