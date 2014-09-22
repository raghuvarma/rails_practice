class ArticlesController < ApplicationController

  def index
   # unless params[:page].blank?
      feed = Feedzirra::Feed.fetch_and_parse("http://feeds.wired.com/wired/index?format=rss") 
      feed.entries.each do |art|
        article=Article.where(:title=>art.title).first
        article=Article.create(:published=>art.published,:author=>art.author,:content=>art.content,:url=>art.url,:title=>art.title) if article.nil?
      end
   # end
    @articles=Article.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def show
     @article=Article.find(params[:id])
     @comments = @article.comments
  end
end
