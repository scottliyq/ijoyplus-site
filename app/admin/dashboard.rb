ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do 
        column do
            panel "News in Categories" do
                table do
                  Category.last(10).map do |category|
                      tr td "#{link_to(category.name, admin_category_path(category))} (#{category.articles_count||0})".html_safe
                  end
                end
            end
        end
        column do
            panel "Recent News" do
                table do 
                	tr 
                		th 'Title' 
                		th 'Posted'
                		th 'created_at'
                  Article.order('id desc').last(10).map do |article|
                    tr 
                    	td link_to(article.title, admin_article_path(article)) 
                    	td article.posted? ? 'Y' : ''
                    	td article.created_at.strftime("%Y-%m-%d %H:%M")
                  end
                end
            end
        end
    end

  end # content
end
