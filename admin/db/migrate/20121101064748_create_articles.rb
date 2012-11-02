class CreateArticles < ActiveRecord::Migration
  def up
  	create_table :articles do |table|
        table.column :category_id, :integer
        table.column :slug, :string
        table.column :title, :string
        table.column :content, :string
        table.timestamps
        table.boolean :posted, :default => true
    end
  end

  def down
  	drop_table :articles
  end
end
