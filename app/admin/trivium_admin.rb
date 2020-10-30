Trestle.resource(:trivium) do
  menu do
    item :trivia, icon: 'fa fa-star'
  end

  form do |_image|
    text_field :content
    select :triviable_type, %w(Section Subsection Location Utility Mezoregion Macroregion)
    text_field :triviable_id
  end
end
