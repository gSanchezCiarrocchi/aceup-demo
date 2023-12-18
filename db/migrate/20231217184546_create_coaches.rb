class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches, id: :string do |t|
      t.string :name, null: false
      t.integer :hourly_rate_in_cents

      t.timestamps
    end

    add_foreign_key :sessions, :coaches, column: :coach_hash_id
    add_index :coaches, :name, unique: true
  end
end
