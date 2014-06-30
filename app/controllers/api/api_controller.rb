module Api
  class ApiController < ApplicationController
    before_filter :require_current_user
  end
end