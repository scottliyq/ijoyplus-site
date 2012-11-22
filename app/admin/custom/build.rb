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
		  		# div pre code `cd #{Rails.root.join('public', STATIC_FOLDER)} && ls -l | awk '{print $6,$7,$8,$9}'`
		  		div do 
			  		semantic_form_for :preview, :method => :GET do |f|
				      f.actions do 
				      	f.submit 'Refresh'
				      end 
				    end
			    end
			    span `cd #{Rails.root.join('public', STATIC_FOLDER)} && ls | wc -l` + " files / folders"
			    span ' | '
			    span link_to('preview static site', "/#{STATIC_FOLDER}/index.html", :target => 'blank')
		  		
		  	end
		  end

		  column do 
		  	panel "3. Deploy " do
		  		div do
			  		semantic_form_for :deploy, :method => :put do |f|
				      f.actions do 
				      	f.submit 'Deploy', :onclick => "return window.confirm('This will override all files on target server, are you really sure?')"
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

      	# one level output
      	# system "cd #{Rails.root.join('public', STATIC_FOLDER)} && wget --html-extension -m -nH -nv -k #{CMS_URL_GENERATING} &"
      	
      	# landing + portal
      	system "cd #{Rails.root.join('public', STATIC_FOLDER)} && mkdir #{STATIC_CHILD_FOLDER}"
      	system "cd #{Rails.root.join('public', STATIC_FOLDER, STATIC_CHILD_FOLDER)} && wget --html-extension -m -nH -nv -k #{CMS_URL_GENERATING}/landing && mv landing.html ../index.html && cp -r assets ../ && sed -i 's/staging.joyplus.tv/www.joyplus.tv/' ../index.html &"

      	flash.now[:notice] = 'Please wait a few sencods before files being generated and ready to preview.'
      elsif request.put?
      	# deploy action
      	result = system("rsync -azv --exclude=.git #{Rails.root.join('public', STATIC_FOLDER)}/ #{MEDIA_SERVER_SYNC_PATH}")
      	flash.now[:notice] = 'All files have been synced to server successfully.' if result
      end
      
    end
  end


end