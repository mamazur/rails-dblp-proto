# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update destroy]
 
  def index
    @publications = if params[:lecturer_id]

                      Publication.where(lecturer_id: params[:lecturer_id])
                    else
                      Publication.all
                     end
  end

  def show; end

  def new
    @publication = Publication.new
  end
 
  def edit; end
 
  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:dblp_id, :publication_description)
  end
end
