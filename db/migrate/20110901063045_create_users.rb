class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.boolean :deleted, :default => false
      t.boolean :credible, :default => false
      t.boolean :admin, :default => false
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :encrypted_password

      t.timestamps
    end
  end
end
