require 'rails_helper'

RSpec.describe GpsLocation do
  it 'validates location' do
    expect(build(:gps_location)).to be_valid
  end
end
