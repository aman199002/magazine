class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :author_id
      t.integer :magazine_id      

      t.timestamps null: false
    end
  end
end
