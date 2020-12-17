class ImageSerializer
  include JSONAPI::Serializer

  attributes :author, :licence, :description, :url

  attribute :thumbnail do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.picture.variant(resize: '60x60').processed,
        only_path: true
      )
    end
  end

  attribute :picture_small do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.picture.variant(resize: '240x240').processed,
        only_path: true
      )
    end
  end

  attribute :picture_medium do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.picture.variant(resize: '360x360').processed,
        only_path: true
      )
    end
  end

  attribute :picture_large do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.picture.variant(resize: '480x480').processed,
        only_path: true
      )
    end
  end

  attribute :picture_huge do |record|
    if record.picture.attached?
      Rails.application.routes.url_helpers.rails_representation_url(
        record.picture.variant(resize: '900x900').processed,
        only_path: true
      )
    end
  end
end
