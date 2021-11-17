class AddCoordinatesToCostumes < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :latitude, :float
    add_column :costumes, :longitude, :float
  end
end
