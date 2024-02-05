class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :category
      t.text :desc

      t.timestamps
    end
  end
end
