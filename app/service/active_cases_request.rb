class ActiveCasesRequest < BaseRequestHandler

  private
  
  def generate_data_payload
    get_total ?
      CountryStat.all.where.not(active_cases: nil).sum(&:active_cases)
    :
      get_country_data.active_cases
  end
  
end