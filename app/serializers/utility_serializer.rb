class UtilitySerializer
  include JSONAPI::Serializer

  has_one :gps_location
  has_many :trivia
  has_many :images

  attributes :utility_type, :name, :subsection_id, :address, :phone_number, :website

  attribute :image_thumbnail do |record|
    if record.images.any? && record.images.first.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.images.first.picture.variant(resize: '80x80').processed,
        only_path: true
      )
    end
  end
end
