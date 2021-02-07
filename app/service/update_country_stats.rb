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
    puts "*"*80
    puts response
    response.parsed_response.each do |hsh|
      data.merge!(hsh) if hsh["Date"].to_date == Date.today
    end
    data
  end
end