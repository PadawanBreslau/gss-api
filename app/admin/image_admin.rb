Trestle.resource(:image) do
  menu do
    item :images, icon: 'fa fa-star'
  end

  form do |_image|
    active_storage_field :picture

    select :imagable_type, %w(Section Subsection Trivia Location Utility)
    text_field :imagable_id, label: 'Id of resource'
    text_field :author
    text_field :licence
    text_field :description
  end
end
