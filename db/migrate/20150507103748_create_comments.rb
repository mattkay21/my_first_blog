class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article, index: true
      t.string :reader_name, limit: 80
      t.text :content

      t.timestamps
    end
  end
end
