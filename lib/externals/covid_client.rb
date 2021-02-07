class CovidClient < RootClient
  def base_url
    ENV['COVID_API'] || 'https://api.covid19api.com'
  end

  def countries_info
    self.get('countries').parsed_response
  end

  def country_stats(country_slug, date)
    self.get("country/#{country_slug}?from=#{date-1}&to=#{date}")
  end
end