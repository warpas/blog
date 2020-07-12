class AddExternalPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :external_posts do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :host_name, null: false
      t.string :host_url, null: false
      t.integer :read_time

      t.timestamps
    end
  end
end
