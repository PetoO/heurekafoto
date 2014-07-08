require 'rails_helper'

RSpec.describe Offer, :type => :model do
  it 'convert cameras name to url' do
    expect(Offer.url_from_name('Nikon D3200')).to eq('http://digitalne-fotoaparaty.heureka.sk/nikon-d3200/')
    expect(Offer.url_from_name('Sony Cyber-Shot DSC-RX100')).to eq('http://digitalne-fotoaparaty.heureka.sk/sony-cyber-shot-dsc-rx100/')
    expect(Offer.url_from_name('Canon PowerShot SX510 HS')).to eq('http://digitalne-fotoaparaty.heureka.sk/canon-powershot-sx510-hs/')
  end

  it 'parses offers' do
    Offer.parse_camera_from_heureka 'Nikon D3200'

    expect(Offer.count).not_to eq(0)

    offer = Offer.first

    expect(offer.price).to eq(389.00)
    expect(offer.shop).to eq('MALL.SK')
    expect(offer.url).to eq('http://www.heureka.sk/exit/mall-sk/749411912/?z=2&p=1')
  end
end
