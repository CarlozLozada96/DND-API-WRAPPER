module Api 
  class AlignmentsController < ApplicationController
    def index 
      alignments_list = Dnd::Client.alignments_list
      render json: alignments_list
    end
  end
end