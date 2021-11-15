class CreateCostumes < ActiveRecord::Migration[6.1]
  def change
    create_table :costumes do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :image_url
      t.float :price
      t.string :location

      t.timestamps
    end
  end
end
