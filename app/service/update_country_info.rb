# this class is being used to update the db with country name, slug and code
# run this while setup to get all countries details for further api calls
class UpdateCountryInfo < ApplicationService

  def call
    update_country_info
  end

  private

  def update_country_info
    # get data from the api and sort it based on slug in ascending order
    # insert the data into db
    countries_data = get_country_data
    sorted_data = countries_data.sort_by { |hsh| hsh["Slug"]}
    sorted_data.each do |hsh|
      CountryStat.create_or_find_by({
        name: hsh["Country"],
        slug: hsh["Slug"],
        code: hsh["ISO2"]
      })
    end
  end

  def get_country_data
    CovidClient.new.countries_info
  end
end