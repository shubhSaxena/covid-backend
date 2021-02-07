class BaseRequestHandler < ApplicationService
  attr_accessor :params, :country_code, :get_total
  def initialize(params)
    @params = params
    @country_code = params[:country_code]
    @get_total = params[:get_total]
  end

  def call
    generate_data_payload
  end

  protected

  def get_country_data
    CountryStat.where(code: country_code).first
  end
  
end