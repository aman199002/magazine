namespace :utilities do
	task :load_data => :environment do
		1.upto(3) do |idx_user|
			user = User.create(name: "tester#{idx_user}", email: "tester#{idx_user}@gmail.com", password: 'tester123')		
			1.upto(5) do |idx|
				magazine = Magazine.create(name: "Magazine#{idx}", description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit')
				puts "magazine #{magazine.name} created"
				1.upto(3) do |idx2|
					article = magazine.articles.new(title: "Article#{idx2}", body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', author_id: user.id)
					article.save
					puts "article #{article.title} created"
			        comment = Comment.build_from( article, user.id, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua" ).save
			    end  
			end
		end		
	end


end