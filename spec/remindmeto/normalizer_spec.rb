require 'remindmeto'

describe RemindMeTo::Normalizer do

  describe '.split_by_interval_keyword' do

    context 'given an interval keyword to split on' do
      it 'returns the index of the interval keyword' do
        arg = %w{remindmeto test in 10 seconds}
        expect(RemindMeTo::Normalizer.split_by_interval_keyword(arg)).to eq 2
      end
    end

  end

end