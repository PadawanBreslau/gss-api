require 'rails_helper'

RSpec.describe Subsection do
  it 'validates section' do
    expect(build(:subsection)).to be_valid
    expect(build(:subsection, section: nil)).not_to be_valid
  end

  it 'allows one subsection order within section' do
    section = create(:section)
    expect do
      create(:subsection, section: section, section_order: 5)
    end.to change(described_class, :count).by(1)

    expect do
      create(:subsection, section: section, section_order: 5)
    end.to raise_error(ActiveRecord::RecordInvalid)

    expect do
      create(:subsection, section: create(:section), section_order: 5)
    end.to change(described_class, :count).by(1)
  end
end
