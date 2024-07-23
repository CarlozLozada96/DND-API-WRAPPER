module Api 
  class ClassesController < ApplicationController
    def index 
      classes_list = Dnd::Client.classes_list
      render json: classes_list
    end
  end
end