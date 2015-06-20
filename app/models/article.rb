class Article < ActiveRecord::Base
	belongs_to :magazine
	belongs_to :author, class_name: 'User', foreign_key: 'author_id'
	has_many :comments, :as => :commentable

	acts_as_commentable
end
