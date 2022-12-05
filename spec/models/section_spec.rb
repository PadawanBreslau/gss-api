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

  context 'with section calculation' do
    it 'creates empty section without any data' do
      section = create(:section)
      expect { section.recalculate_information }.not_to raise_error
      expect(section.length).to eq 0.0
      expect(section.total_length).to eq 0.0
      expect(section.ascent).to eq 0
      expect(section.descent).to eq 0
    end

    it 'creates section without one subsection data' do
      section = create(:section)
      subsection = create(:subsection, :with_information, section: section)
      section.reload
      expect(section.length).to eq subsection.length
      expect(section.ascent).to eq subsection.ascent
      expect(section.descent).to eq subsection.descent
      expect(section.total_length).to eq subsection.length
    end

    it 'creates section without more subsection data' do
      section = create(:section)
      subsection = create(:subsection, :with_information, section: section, section_order: 0)
      subsection2 = create(:subsection, :with_information, section: section, section_order: 1)
      expect(section.length).to eq subsection.length + subsection2.length
      expect(section.ascent).to eq subsection.ascent + subsection2.ascent
      expect(section.descent).to eq subsection.descent + subsection2.descent
      expect(section.total_length).to eq subsection.length + subsection2.length
    end

    it 'creates sections without more subsection data' do
      section = create(:section, order: 0)
      subsection = create(:subsection, :with_information, section: section, section_order: 0)
      subsection2 = create(:subsection, :with_information, section: section, section_order: 1)
      expect(section.length).to eq subsection.length + subsection2.length
      expect(section.ascent).to eq subsection.ascent + subsection2.ascent
      expect(section.descent).to eq subsection.descent + subsection2.descent
      expect(section.total_length).to eq subsection.length + subsection2.length

      section2 = create(:section, order: 1)
      subsection3 = create(:subsection, :with_information, section: section2, section_order: 0)
      expect(section2.length).to eq subsection3.length
      expect(section2.ascent).to eq subsection3.ascent
      expect(section2.descent).to eq subsection3.descent
      expect(section2.total_length.round(1)).to eq (section.length + subsection3.length).round(1)
    end
  end
end
