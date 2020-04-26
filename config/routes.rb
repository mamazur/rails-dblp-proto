# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :publications
  resources :lecturers
  resources :module_descriptions

  root 'welcome#index'

end
