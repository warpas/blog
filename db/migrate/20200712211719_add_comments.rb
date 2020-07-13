class AddComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter_name, null: false
      t.string :commenter_url
      t.text :content, null: false
      t.integer :score, default: 0

      t.timestamps
    end
    add_reference :comments, :post, foreign_key: true, null: false
  end
end
