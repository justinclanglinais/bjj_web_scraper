class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :team
      t.string :belt
      t.integer :weight
      t.integer :place
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
