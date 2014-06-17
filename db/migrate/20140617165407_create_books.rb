class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :amazon_id
      t.integer :rating
      t.string :finished_on

      t.timestamps
    end
  end
end
