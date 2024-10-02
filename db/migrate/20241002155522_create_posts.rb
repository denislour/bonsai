class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :excerpt
      t.text :content
      t.date :date
      t.string :image
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
