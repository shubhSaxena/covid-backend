class TotalDeathsRequest < BaseRequestHandler

  private
  
  def generate_data_payload
    get_total ?
      CountryStat.all.where.not(total_deaths: nil).sum(&:total_deaths)
    :
      get_country_data.total_deaths
  end
end