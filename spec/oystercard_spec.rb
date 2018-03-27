require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "returns balance if within limit" do
    expect(subject.top_up(80)).to eq(80)
  end

  it "raises error" do
    expect { subject.top_up(91) }.to raise_error described_class::LIMIT_ERROR
  end

end
