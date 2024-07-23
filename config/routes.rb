Rails.application.routes.draw do
namespace :api do 
  get'/home', to: 'home#index'
  get '/scores', to: 'scores#index'
  get '/alignments', to: 'alignments#index'
  get '/skills', to: 'skills#index'
  get '/classes', to: 'classes#index'
  get '/races', to: 'races#index'
  get '/subclasses', to: 'subclasses#index'
 end
end