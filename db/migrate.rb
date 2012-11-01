#!/usr/bin/ruby

# require 'active_record'

# ActiveRecord::Base.establish_connection(
#     :adapter => "sqlite3",
#     :database  => "db/site.db"
# )


ActiveRecord::Schema.define do
    create_table :categories do |table|
        table.column :name, :string
    end

    create_table :articles do |table|
        table.column :category_id, :integer
        table.column :slug, :string
        table.column :title, :string
        table.column :content, :string
        table.timestamps
        table.boolean :hide, :default => false
    end
end