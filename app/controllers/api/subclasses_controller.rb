module Api 
  class SubclassesController < ApplicationController
    def index 
      subclasses_list = Dnd::Client.subclasses_list
      render json: subclasses_list
    end
  end
end