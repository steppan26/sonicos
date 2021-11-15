class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :costume, null: false, foreign_key: true
      t.date :date_of_hire
      t.integer :duration
      t.string :status

      t.timestamps
    end
  end
end
