class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :source, foreign_key: true

      t.string :title, :null => false
      t.text :description, :default => 'Click for details'
      t.string :top_img
      t.string :link, :null => false
      t.string :keywords, :default => ''
      t.datetime :pub_date

      t.timestamps
    end
    add_index('articles', 'title')
  end
end
