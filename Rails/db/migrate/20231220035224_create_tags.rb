class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  
    create_table :article_tags do |t|
      t.references :article, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
   end
  end
end
