class CreateCountryStats < ActiveRecord::Migration[6.0]
  def change
    create_table :country_stats do |t|
      t.string :name
      t.string :slug
      t.string :code
      t.integer :active_cases
      t.integer :total_deaths
      t.boolean :data_updated
      t.datetime :data_updated_at
      t.timestamps
    end

    add_index :country_stats, :code
    add_index :country_stats, :slug
  end
end
