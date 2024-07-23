module Dnd 
  class Client
    def self.home_list
      Dnd::Request.call('get', '/')
    end

    def self.scores_list
      Dnd::Request.call('get', '/ability-scores')
    end

    def self.alignments_list
      Dnd::Request.call('get', '/alignments')
    end

    def self.races_list
      Dnd::Request.call('get', '/races')
    end

    def self.classes_list
      Dnd::Request.call('get', '/classes')
    end

    def self.skills_list
      Dnd::Request.call('get', '/skills')
    end


    def self.subclasses_list
      Dnd::Request.call('get', '/subclasses')
    end
  end
end