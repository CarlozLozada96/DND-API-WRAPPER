module Api 
  class SkillsController < ApplicationController
    def index 
      skills_list = Dnd::Client.skills_list
      render json: skills_list
    end
  end
end