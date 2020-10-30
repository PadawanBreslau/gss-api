class AddSubsectionIdToUtilities < ActiveRecord::Migration[6.0]
  def change
    add_column :utilities, :subsection_id, :integer
  end
end
