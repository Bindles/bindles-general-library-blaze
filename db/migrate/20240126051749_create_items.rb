class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :body
      t.string :access
      t.string :pass

      t.timestamps
    end
  end
end
