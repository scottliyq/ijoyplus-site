class CreateCategories < ActiveRecord::Migration
  def up
  	create_table :categories do |table|
        table.column :name, :string
        table.string :slug
    end
  end

  def down
  	drop_table :categories
  end
end
