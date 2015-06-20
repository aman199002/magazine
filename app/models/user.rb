class User < OmniAuth::Identity::Models::ActiveRecord
	has_many :articles, foreign_key: 'author_id'
	has_many :comments
end
