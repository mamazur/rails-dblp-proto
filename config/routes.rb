# frozen_string_literal: true

Rails.application.routes.draw do

  resources :publications
  resources :lecturers
  resources :module_descriptions

  root 'lecturers#index'

end
