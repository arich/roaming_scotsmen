class CategoriesHasManyAttractions < ActiveRecord::Migration
  def change
  	add_reference :attractions, :categories, index: true
  end
end
