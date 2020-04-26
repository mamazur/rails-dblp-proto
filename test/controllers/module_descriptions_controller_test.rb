# frozen_string_literal: true

require 'test_helper'

class ModuleDescriptionsControllerTest < ActionController::TestCase
  setup do
    @module_description = module_descriptions(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:module_descriptions)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create module_description' do
    assert_difference('ModuleDescription.count') do
      post :create, module_description: { description: @module_description.description, lecturer: @module_description.lecturer, name: @module_description.name }
    end

    assert_redirected_to module_description_path(assigns(:module_description))
  end

  test 'should show module_description' do
    get :show, id: @module_description
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @module_description
    assert_response :success
  end

  test 'should update module_description' do
    patch :update, id: @module_description, module_description: { description: @module_description.description, lecturer: @module_description.lecturer, name: @module_description.name }
    assert_redirected_to module_description_path(assigns(:module_description))
  end

  test 'should destroy module_description' do
    assert_difference('ModuleDescription.count', -1) do
      delete :destroy, id: @module_description
    end

    assert_redirected_to module_descriptions_path
  end
end
