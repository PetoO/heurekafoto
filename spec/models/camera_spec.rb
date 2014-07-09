require 'rails_helper'

RSpec.describe Camera, :type => :model do

  it 'parses cameras' do
    html = File.read(File.dirname(__FILE__) + '/fotoheureka.html', encoding: 'utf-8')
    Camera.parse_from_heureka(html)

    expect(Camera.count).not_to eq(0)

    camera = Camera.first

    expect(camera.name).to eq('Nikon D3200')

  end
end
