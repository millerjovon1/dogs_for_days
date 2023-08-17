class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :renter, foreign_key: { to_table: :users }
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
