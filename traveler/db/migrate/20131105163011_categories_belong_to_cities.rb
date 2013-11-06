class CategoriesBelongToCities < ActiveRecord::Migration
  def change
  	add_reference :categories, :cities, index: true
  end
end
