class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name, :null => false, :limit => 40
      t.string :website, :null => false

      t.timestamps
    end
  end
end
