class InitialSchemaUser < ActiveRecord::Migration
  def up
    create_table "users" do |t|
      t.string "username",          :limit => 250
      t.string "password_digest",   :limit => 250
      t.timestamps
    end
  end

  def down
    drop_table "users"
  end
end

