class InitialSchema < ActiveRecord::Migration
  def up
    create_table "songs" do |t|
      t.date    "date"
      t.string  "title",     :limit => 250
      t.string  "content",   :limit => 2500
      t.integer "priority"
      t.boolean "final"
      t.integer "user_id"
      t.timestamps
    end

    create_table "verses" do |t|
      t.date    "date"
      t.string  "tag",      :limit => 250
      t.string  "content",  :limit => 750
      t.integer "user_id"
      t.timestamps
    end

    create_table "titles" do |t|
      t.string  "title",  :limit => 250
      t.boolean "void"    
      t.integer "user_id"
      t.timestamps
    end
  end

  def down
    drop_table "songs"
    drop_table "verses"
    drop_table "titles"
  end
end

