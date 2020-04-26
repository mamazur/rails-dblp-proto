# frozen_string_literal: true

class ModuleDescriptionsController < ApplicationController
  before_action :set_module_description, only: %i[show edit update destroy]
 
  def index
    @module_descriptions = ModuleDescription.all
  end
 
  def show
    @module_description = ModuleDescription.find(params[:id])
    @lecturers = Lecturer.all
  end

  def new
    @module_description = ModuleDescription.new
    @lecturers = Lecturer.all
  end

  def edit
    @module_description = ModuleDescription.find(params[:id])
  end

  def create
    @module_description = ModuleDescription.new(module_description_params)
  
    respond_to do |format|
      if @module_description.save
        format.html { redirect_to @module_description, notice: 'Module description was successfully created.' }
        format.json { render :show, status: :created, location: @module_description }
      else
        format.html { render :new }
        format.json { render json: @module_description.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @module_description.update(module_description_params)
        format.html { redirect_to @module_description, notice: 'Module description was successfully updated.' }
        format.json { render :show, status: :ok, location: @module_description }
      else
        format.html { render :edit }
        format.json { render json: @module_description.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @module_description.destroy
    respond_to do |format|
      format.html { redirect_to module_descriptions_url, notice: 'Module description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_module_description
    @module_description = ModuleDescription.find(params[:id])
  end

  def module_description_params
    params.require(:module_description).permit(:name, :lecturer, :description, lecturer_ids: [])
  end
end
