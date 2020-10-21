require 'rails_helper'

RSpec.describe GpsLocation do
  it 'validates location' do
    expect(build(:gps_location)).to be_valid
    expect(build(:gps_location, lon: 89.9)).to be_valid
    expect(build(:gps_location, lat: 89.9)).to be_valid
    expect(build(:gps_location, lon: -89.9)).to be_valid
    expect(build(:gps_location, lat: -89.9)).to be_valid
    expect(build(:gps_location, lon: 90.9)).to be_valid
    expect(build(:gps_location, lat: 90.9)).not_to be_valid
  end
end
