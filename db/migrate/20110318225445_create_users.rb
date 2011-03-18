class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :location
      t.string :timezone
      t.string :bio
      t.string :privacy
      t.string :webpage

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
