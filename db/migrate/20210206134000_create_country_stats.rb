class CreateCountryStats < ActiveRecord::Migration[6.0]
  def change
    create_table :country_stats do |t|
      t.string :name
      t.string :slug
      t.string :code
      t.integer :active_cases
      t.integer :total_deaths
      t.timestamps
    end
  end
end
