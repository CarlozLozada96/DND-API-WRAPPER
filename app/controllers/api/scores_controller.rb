module Api 
  class ScoresController < ApplicationController
    def index 
      scores_list = Dnd::Client.scores_list
      render json: scores_list
    end
  end
end