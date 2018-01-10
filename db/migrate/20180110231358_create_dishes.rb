class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :type_of_cuisine_id

      t.timestamps

    end
  end
end
