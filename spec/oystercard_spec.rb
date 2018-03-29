require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "returns balance if within limit" do
    expect(subject.top_up(80)).to eq(80)
  end

  it "raises error when limit is exceeded" do
    expect { subject.top_up(91) }.to raise_error described_class::LIMIT_ERROR
  end

  it "reflects fare on balance" do
    subject.top_up(90)
    expect(subject.deduct(3.5)).to eq(86.5)
  end

  it "changes card status to in journey when touched in" do
    subject.top_up(1)
    expect(subject.touch_in).to eq(:in_journey)
  end

  it "returns true when in journey" do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "changes card to nil when touched out" do
    subject.top_up(1)
    subject.touch_in
    expect(subject.touch_out).to eq(nil)
  end

  it "raises error when balance is low" do
    subject.top_up(0.9)
    expect {subject.touch_in}.to raise_error described_class::BALANCE_ERROR
  end
end
