class CreateAdresses < ActiveRecord::Migration
  def self.up
    create_table :adresses do |t|
      t.string :adress
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :adresses
  end
end
