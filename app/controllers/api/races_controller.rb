module Api 
  class RacesController < ApplicationController
    def index 
      races_list = Dnd::Client.races_list
      render json: races_list
    end
  end
end