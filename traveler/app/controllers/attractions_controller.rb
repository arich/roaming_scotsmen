class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def initialize
    @api_caller = ApiCaller.new
  end

  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
    puts params

  end

  def search
    if params[:city].nil? 
      raise ArgumentError
    end

    puts params
    query_hash = {}
    push_if_not_nil :q, query_hash
    push_if_not_nil :category, query_hash
    push_if_not_nil :lat, query_hash
    push_if_not_nil :long, query_hash
    query_hash[:tag] = :tg_info

    @attractions = @api_caller.get_attractions_for_city(params[:city], query_hash)["list"]["link"]

    @hash = Gmaps4rails.build_markers(@attractions) do |attraction, marker|
      marker.lat attraction["@latitude"]
      marker.lng attraction["@longitude"]
    end
  end

  def push_if_not_nil param, hash
    if not params[param].nil?
      hash[param] = params[param]
    end
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attraction_params
    params.require(:attraction).permit(:q, :category, :lat, :long, :city, :tag)
  end
end