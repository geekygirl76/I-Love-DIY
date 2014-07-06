module Api
  class ApiController < ApplicationController
    before_action :require_current_user
  end
end