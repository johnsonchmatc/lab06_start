class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :height_feet
      t.integer :height_inches
      t.integer :weight
      t.string :ssn
      t.date :date_of_birth
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
