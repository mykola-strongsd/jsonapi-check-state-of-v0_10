class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.integer :taggable_id
      t.string :taggable_type
    end
  end
end
