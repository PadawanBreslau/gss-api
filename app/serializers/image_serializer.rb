class ImageSerializer
  include JSONAPI::Serializer

  attributes :information

  attribute :picture_small do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.image.variant(resize: '240x240').processed
      )
    end
  end

  attribute :picture_large do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.image.variant(resize: '480x480').processed
      )
    end
  end
end
