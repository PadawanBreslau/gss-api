Trestle.resource(:image) do
  menu do
    item :images, icon: 'fa fa-star'
  end

  form do |image|
    active_storage_field :picture
    select :imagable_type, %w(Section Subsection Trivia Location Utility)
    text_field :imagable_id
  end
end
