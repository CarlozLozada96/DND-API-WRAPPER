module Api 
  class HomeController < ApplicationController
    def index 
      home_list = Dnd::Client.home_list
      render json: home_list
    end
  end
end