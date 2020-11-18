Trestle.resource(:image) do
  scope :section
  scope :subsection, default: true
  scope :utility, default: true
  scope :location, default: true

  menu do
    item :images, icon: 'fa fa-star'
  end

  active_storage_fields do
    [:picture]
  end

  form do |_image|
    select :imagable_type, %w(Section Subsection Trivia Location Utility)
    active_storage_field :picture
    text_field :imagable_id, label: 'Id of resource'
    text_field :description
    text_field :author
    text_field :licence
    text_field :url
  end
end
