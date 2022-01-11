class CreateFunctionalities < ActiveRecord::Migration[6.1]
  def change
    create_table :functionalities do |t|
      t.string :title
      t.integer :percentage

      t.timestamps
    end
  end
end
