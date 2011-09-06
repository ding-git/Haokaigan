# coding: utf-8
class EstablishesController < ApplicationController
  
  before_filter :verification
  before_filter :title
  
  # GET /establishes
  # GET /establishes.json
  def index
    @establishes = Establish.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @establishes }
    end
  end

  # GET /establishes/1
  # GET /establishes/1.json
  def show
    @establish      = Establish.find(params[:id])
    @chapter        = @establish.chapter.includes(['note'],['tip'],['partner'])
    @noti           = User.find(current_user.id).notification
    
    unless @establish.chapter.empty?
      @note           = @chapter.first.note
      @tips           = @chapter.first.tip
      @partners       = @chapter.first.partner
      params[:more]   ||= @chapter.first.id
      @current_chapter = @chapter.find(params[:more])
    else
      @chapter_one    = []
      @note           = []
      @tips           = []
      @partners       = []
    end
    
    if @establish.id != Establish.last.id
      @button_path = (params[:id].to_i+1).to_s
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @establish }
    end
  end

  # GET /establishes/new
  # GET /establishes/new.json
  def new
    @establish = Establish.new
    unless params[:id].nil?
      @chapter        = Establish.find(params[:id]).chapter
      @note           = @chapter.find(params[:more]).note
      @tips           = @chapter.find(params[:more]).tip
      @partners       = @chapter.find(params[:more]).partner
      @current_chapter = @chapter.find(params[:more])
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @establish }
      format.js
    end
  end

  # GET /establishes/1/edit
  def edit
    @establish = Establish.find(params[:id])
  end

  # POST /establishes
  # POST /establishes.json
  def create
    @establish = Establish.new(params[:establish])

    respond_to do |format|
      if @establish.save
        format.html { redirect_to @establish, notice: 'Establish was successfully created.' }
        format.json { render json: @establish, status: :created, location: @establish }
      else
        format.html { render action: "new" }
        format.json { render json: @establish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /establishes/1
  # PUT /establishes/1.json
  def update
    @establish = Establish.find(params[:id])

    respond_to do |format|
      if @establish.update_attributes(params[:establish])
        format.html { redirect_to admin_index_path, notice: 'Establish was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @establish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establishes/1
  # DELETE /establishes/1.json
  def destroy
    @establish = Establish.find(params[:id])
    @establish.destroy

    respond_to do |format|
      format.html { redirect_to establishes_url }
      format.json { head :ok }
    end
  end
  
  
  def add
    
        @note = Note.new()
    
    respond_to do |format|
      format.js
    end  
    
  end
  
  private
  
  def title
    @title = '公司注册 - '
  end
  
end
