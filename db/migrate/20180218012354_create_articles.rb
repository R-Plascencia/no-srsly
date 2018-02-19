class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :source, foreign_key: true

      t.string :title, :null => false
      t.text :summary, :default => 'Click for details'
      t.string :top_img
      t.string :url, :null => false
      t.string :keywords, :default => ''
      t.datetime :pub_date

      t.timestamps
    end
    add_index('articles', 'title')
  end
end
