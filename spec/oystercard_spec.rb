require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up).with(1).argument }


end
