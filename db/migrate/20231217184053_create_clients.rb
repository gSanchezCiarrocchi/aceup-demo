class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients, id: :string do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_foreign_key :sessions, :clients, column: :client_hash_id
    add_index :clients, :email, unique: true
  end
end
