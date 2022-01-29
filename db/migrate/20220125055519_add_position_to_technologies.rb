class AddPositionToTechnologies < ActiveRecord::Migration[6.1]
  def change
    add_column :technologies, :position, :integer
  end
end
