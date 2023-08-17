class AddLocationAndGenderToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :location, :string
    add_column :dogs, :latitude, :float
    add_column :dogs, :longitude, :float
    add_column :dogs, :gender, :string
  end
end
