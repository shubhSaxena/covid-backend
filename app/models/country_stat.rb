class CountryStat < ApplicationRecord
  validates_presence_of :name, :slug, :code
  validates_uniqueness_of :slug, :code
end
