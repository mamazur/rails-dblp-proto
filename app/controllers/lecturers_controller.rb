# frozen_string_literal: true

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'

class LecturersController < ApplicationController
  BASE_URL = 'http://dblp.uni-trier.de'
  PERS_DIR = '/rec/pers/'
  KX_URL = '/xk'
  BIBTEX_URL = 'http://dblp.uni-trier.de/rec/bibtex/'
  SEARCH_URL = '/search/author?xauthor='
  before_action :set_lecturer, only: %i[show edit update destroy]

  def index
    @lecturers = Lecturer.all
  end

  def show
    @publications = Publication.where(lecturer_id: params[:id])
  end

  def new
    @lecturer = Lecturer.new
    @lecturer.publications.build
  end

  def edit
    @lecturer.publications.build
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        @publications = Publication.where(lecturer_id: params[:id])
        get_urlpt = Nokogiri::HTML(open("#{BASE_URL}#{SEARCH_URL}#{@lecturer.first_name}:#{@lecturer.family_name}").read)
        get_urlpt.xpath('//author/@urlpt').each do |dblpkey_element|
          result_url_author = "#{BASE_URL}#{PERS_DIR}#{dblpkey_element}#{KX_URL}"
          file_content_all = Nokogiri::HTML(open(result_url_author.to_s).read)
          file_content_all.xpath('//dblpkey').each do |dblpkey_key|
            pub_title = Nokogiri::HTML(open("http://dblp.uni-trier.de/rec/bibtex/#{dblpkey_key.text}.xml").read).xpath('//title/text()')
            pub_key = Nokogiri::HTML(open("http://dblp.uni-trier.de/rec/bibtex/#{dblpkey_key.text}.xml").read).xpath('//inproceedings/@key')
            unless Publication.exists?(dblp_id: pub_key.to_s)
              @publication = Publication.create(dblp_id: pub_key, lecturer_id: @lecturer.id, publication_description: pub_title)
            end
          end
        end
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:first_name, :family_name, publications_attributes: %i[dblp_id publication_description])
  end
end
