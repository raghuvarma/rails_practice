class CommentsController < ApplicationController
 
  def new
    @article=Article.find(params[:article_id])
    @comment=Comment.new
    @comments = @article.comments
  end

 def create
    @article=Article.find(params[:article_id])
    @comments = @article.comments
    @comment = Comment.new(params[:comment])
    @comment.article_id=@article.id
    respond_to do |format|
      if @comment.save
        format.js 
      else
        format.js { render js: "bad" }
      end
    end
  end
end
