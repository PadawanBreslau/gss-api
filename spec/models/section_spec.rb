require 'rails_helper'

RSpec.describe Section do
  it 'validates section' do
    expect(build(:section)).to be_valid
    expect(build(:section, start: nil)).not_to be_valid
  end

  it 'allows one section oreder with variation' do
    expect do
      create(:section, order: 5)
    end.to change(described_class, :count).by(1)

    expect do
      create(:section, order: 5)
    end.to raise_error(ActiveRecord::RecordInvalid)

    expect do
      create(:section, order: 5, variation: 1)
    end.to change(described_class, :count).by(1)
  end
end
