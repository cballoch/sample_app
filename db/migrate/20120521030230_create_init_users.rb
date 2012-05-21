class CreateInitUsers < ActiveRecord::Migration
  def self.up
    create_table :init_users do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :init_users
  end
end
