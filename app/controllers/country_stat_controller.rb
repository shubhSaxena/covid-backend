# controller to fetch data from db
# receive country code from the webservice
# also get_total is used to fetch the total world data
# it will be false if there is conutry code
# {
#   country_code: "IN",
#   get_total: false
# }
class CountryStatController < ApplicationController
  protect_from_forgery with: :null_session
  def active_cases
    render json: ActiveCasesRequest.call(all_params)
  end

  def total_deaths
    render json: TotalDeathsRequest.call(all_params)
  end

  private

  def all_params
    params.require(:country_stat).permit(:country_code, :get_total)
  end
end
