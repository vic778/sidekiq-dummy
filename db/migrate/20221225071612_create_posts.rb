class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published, default: false
      t.boolean :schedule, default: false
      t.datetime :published_at

      t.timestamps
    end
  end
end
