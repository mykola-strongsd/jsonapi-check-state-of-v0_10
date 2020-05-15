class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :author_id
      t.text :content
    end
  end
end
