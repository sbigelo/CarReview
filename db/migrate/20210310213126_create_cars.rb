class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mpg
      t.string :msrp
      

      t.timestamps
    end
  end
end
