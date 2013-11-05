class CitiesHasManyAttractions < ActiveRecord::Migration
  def change
  	add_reference :attractions, :cities, index: true
  end
end
