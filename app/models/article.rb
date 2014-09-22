class Article < ActiveRecord::Base
   attr_accessible :published, :author, :content, :url, :title

  has_many :comments
end
