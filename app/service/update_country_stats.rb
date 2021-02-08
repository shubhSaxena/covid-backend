# this will update active cases and deaths into db
class UpdateCountryStats < ApplicationService
  def call
    update_coutry_data
  end

  private

  def update_coutry_data
    CountryStat.all.update_all(data_updated: false)
    CountryStat.all.each do |country|
      stats = get_country_stats(country.slug)
      country.update!(active_cases: stats["Active"], total_deaths: stats["Deaths"], 
        data_updated: true, data_updated_at: DateTime.current)
    end
  end

  def get_country_stats(country_slug)
    data = {}
    response = CovidClient.new.country_stats(country_slug, Date.today)
    if response.code == 200
      response.parsed_response.each do |hsh|
        data.merge!(hsh) if hsh["Date"].to_date == Date.today
      end
    else
      # sleep for 40 minutes bcz of rate limit issue in the given api
      sleep(40.minutes)
    end
    data
  end
end