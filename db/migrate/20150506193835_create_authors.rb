class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40
      t.string :email
      t.string :pen_name, limit: 60
      t.string :password_digest, limit: 40

      t.timestamps
    end
    
  end
end
