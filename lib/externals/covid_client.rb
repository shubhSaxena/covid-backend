class CovidClient < RootClient
  def base_url
    ENV['COVID_API'] || 'https://api.covid19api.com'
  end

  def countries_info
    self.get('countries')
  end

  # def country_stats
  #   self.get
  # end
end