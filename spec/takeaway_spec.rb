require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:order_confirmation) {double :order_confirmation}
  let(:text) {double :text}

  it 'shows a list of available dishes' do
    expect(takeaway.show_menu).to include ({"chips" => 2})
  end

  it 'raises an error if a dish is not available' do
    msg = 'That dish is not available'
    expect{takeaway.add("rice",2)}.to raise_error msg
  end

  it 'adds dishes to selected dishes' do
    takeaway.add("chips",2)
    msg = "Your selected dishes are {\"chips\"=>2}"
    expect(takeaway.view_order).to eq msg
  end

  it 'shows the total price of the order' do
  takeaway.add("chips",2)
  takeaway.add("burger",2)
  msg = "Your total order price is £14"
  expect(takeaway.order_price).to eq msg

  end

  it 'sends a text once confirming the order' do
    allow(:order_confirmation).to receive(:text)
    takeaway.add("chips",2)
    takeaway.add("burger",2)
    expect(takeaway.order_confirmation).not_to raise_error
  end
end
