ActiveAdmin.register_page "Deploy" do
  content do
  	columns do 
  		column do 
		    panel "1. Build" do
		      semantic_form_for :build do |f|
			      f.actions do 
			      	f.submit 'Build'
			      end 
			    end
		    end 
		  end

		  column do 
		  	panel "2. Preview " do
		  		div pre code `cd #{Rails.root.join('public', STATIC_FOLDER)} && ls -l | awk '{print $6,$7,$8,$9}'`
		  		div link_to('preview static site', "/#{STATIC_FOLDER}/", :target => 'blank')
		  	end
		  end

		  column do 
		  	panel "3. Deploy " do
		  		div do
			  		semantic_form_for :deploy, :method => :put do |f|
				      f.actions do 
				      	f.submit 'Deploy'
				      end 
				    end
				  end
			    div link_to('visit live site', MEDIA_SERVER_URL, :target => 'blank')
		  	end
		  end
		end

  end

  controller do
    def index
      if request.post?
      	# build action
      	system "rm -rf #{Rails.root.join('public', STATIC_FOLDER)}"
      	system "cd #{Rails.root.join('public')} && mkdir #{STATIC_FOLDER}"
      	system "cd #{Rails.root.join('public', STATIC_FOLDER)} && wget --html-extension -m -nH -nv -k #{CMS_URL_GENERATING} &"
      	flash.now[:notice] = 'Please wait a few sencods before files being generated and ready to preview.'
      	# system "cd #{Rails.root} && rake static:wget --trace 2>&1 >> #{Rails.root}/log/rake.log &"
      elsif request.put?
      	# deploy action
      	# result = system("rsync ...")
      	# flash.now[:notice] = 'All files have been synced to server successfully.' if result
      end
      
    end
  end


end