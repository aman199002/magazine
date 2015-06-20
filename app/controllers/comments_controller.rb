class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end	

	def create
		# debugger
		@article = Article.where(id: params[:article_id]).first
		@comment = Comment.build_from( @article, current_user.id, params[:comment] )
		@comment.save
		redirect_to @article, notice: "Comment added!"
		puts "hi"
	end	

	def create_child
		parent_comment = Comment.where(id: params[:id]).first
		article = parent_comment.commentable
		@comment = Comment.build_from( article, current_user.id, params[:comment] )
		@comment.save
		@comment.move_to_child_of(parent_comment)		
		redirect_to article, notice: "Comment added!"
	end	

	def destroy
		comment = Comment.where(id: params[:id]).first
		comment.destroy
		redirect_to comment.commentable, notice: 'Comment deleted!'
	end	
end
