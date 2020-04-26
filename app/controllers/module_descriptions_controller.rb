# frozen_string_literal: true

class ModuleDescriptionsController < ApplicationController
  before_action :set_module_description, only: %i[show edit update destroy]

  # GET /module_descriptions
  # GET /module_descriptions.json
  def index
    @module_descriptions = ModuleDescription.all
  end

  # GET /module_descriptions/1
  # GET /module_descriptions/1.json
  def show
    @module_description = ModuleDescription.find(params[:id])
    @lecturers = Lecturer.all
  end

  # GET /module_descriptions/new
  def new
    @module_description = ModuleDescription.new
    @lecturers = Lecturer.all
  end

  # GET /module_descriptions/1/edit
  def edit
    @module_description = ModuleDescription.find(params[:id])
  end

  # POST /module_descriptions
  # POST /module_descriptions.json
  def create
    @module_description = ModuleDescription.new(module_description_params)
    #   params[:lecturers].each do |lecturer|
    #   @module_description.lecturers << Lecturer.find_by(lecturer)
    # end

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

  # PATCH/PUT /module_descriptions/1
  # PATCH/PUT /module_descriptions/1.json
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

  # DELETE /module_descriptions/1
  # DELETE /module_descriptions/1.json
  def destroy
    @module_description.destroy
    respond_to do |format|
      format.html { redirect_to module_descriptions_url, notice: 'Module description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_module_description
    @module_description = ModuleDescription.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def module_description_params
    params.require(:module_description).permit(:name, :lecturer, :description, lecturer_ids: [])
  end
end
