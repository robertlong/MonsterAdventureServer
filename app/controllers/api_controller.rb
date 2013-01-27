class ApiController < ApplicationController

  helper_method :has_valid_api_key?
  before_filter :api_authenticate!

  protected

  def has_valid_api_key?
    params[:key] == "spaghettipoop"
  end

  def api_authenticate!
    unless has_valid_api_key?
      respond_with :error => "You do not have access to this page."
    end
  end

end
