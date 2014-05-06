class CreateUrls < ActiveRecord::Migration
  def up
    create_table :urls do |t|
      t.string :long_url, uniqueness: true
      t.string :short_url
      t.integer :click_count, default: 0
    end
  end

  def down
    drop_table :urls
  end
end
