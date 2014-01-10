class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :password_digest, :null => false
      t.string :token
      t.timestamps
    end
    add_index :users, :token

    add_column :feeds, :user_id, :integer #, :null => false
  end
end
