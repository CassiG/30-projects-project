class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true, on_delete: :nullify
      t.references :post, foreign_key: true, on_delete: :nullify

      t.timestamps
    end
  end
end
