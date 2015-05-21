class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :author, index: true
      t.string :title, limit: 80
      t.string :subhead, limit: 140
      t.text :content
      t.string :permalink
      t.boolean :comments_enabled

      t.timestamps
    end
    add_index :articles, :permalink
  end
end
