module Utils
  def normalize(name)
    name.split.map(&:downcase).join('_')
  end
end
