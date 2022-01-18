class AddPostStatusToTechnologies < ActiveRecord::Migration[6.1]
  def change
    add_column :technologies, :status, :integer, default: 0
  end
end
