class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.integer :location, default: 0
      t.string :color, default: '#000000'
      t.integer :duration, null: false
      t.boolean :payment_required, default: false
      t.integer :price, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
