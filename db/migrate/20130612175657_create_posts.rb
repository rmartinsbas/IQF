class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :project
      t.string :author
      t.string :destination
      t.string :discipline
      t.string :tag
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
