module RemindMeTo
  class Options
    attr_accessor :message, :interval, :repeat

    def initialize(args)
      keyword_idx = RemindMeTo::Normalizer.split_by_interval_keyword(args)
      @message = RemindMeTo::Normalizer.get_message(args, keyword_idx)
      @interval = RemindMeTo::Normalizer.get_interval(args)
      @repeat = RemindMeTo::Normalizer.get_repeat(args, keyword_idx)
    end

  end
end