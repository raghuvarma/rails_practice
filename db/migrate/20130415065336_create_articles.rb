class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.timestamp :published
      t.string :title
      t.string :author
      t.string :url
      t.text :content
      t.timestamps
    end
  end
end
