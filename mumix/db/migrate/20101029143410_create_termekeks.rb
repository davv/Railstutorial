class CreateTermekeks < ActiveRecord::Migration
  def self.up
    create_table :termekeks do |t|
      t.string :cikkszam
      t.string :megnev
      t.string :tul
      t.text :leir
      t.string :egyseg
      t.float :ar

      t.timestamps
    end
  end

  def self.down
    drop_table :termekeks
  end
end
