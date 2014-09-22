class ArticlesController < ApplicationController

  def index
   	feeds = Feedjira::Feed.fetch_and_parse("http://feedjira.com/blog/feed.xml") # returns a Hash, with each url having a Feedjira::Feed object
      feeds.entries.each do |art|
        article=Article.where(:title=>art.title).first
        article=Article.create(:published=>art.published,:author=>art.author,:content=>art.content,:url=>art.url,:title=>art.title) if article.nil?
      end

    @articles=Article.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def show
     @article=Article.find(params[:id])
     @comments = @article.comments
  end
end
