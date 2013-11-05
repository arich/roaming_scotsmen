class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :category

      t.timestamps
    end
  end
end
