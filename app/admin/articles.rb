ActiveAdmin.register Article do
  index do
  	selectable_column
  	column :id
    column :title
    column :slug
    column :created_at
    column :updated_at
    column :posted
   	default_actions 
  end	
end
