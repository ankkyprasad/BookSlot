class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :status, default: 0
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :paid, default: false
      t.boolean :email_verified, default: false
      t.string :email_verification_token
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
