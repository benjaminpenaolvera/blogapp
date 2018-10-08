class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :status
      t.string :tags

      t.timestamps null: false
    end
  end
end
