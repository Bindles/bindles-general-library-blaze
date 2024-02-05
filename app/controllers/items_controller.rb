#Items_Controller.rb
class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

require 'uri'
require 'net/http'

def lp
  # Your logic to fetch data for the partial
  @items = Item.find(1)
  #render partial: 'items/partial', locals: { items: @items }
  render turbo_stream: turbo_stream.append('partial_frame', partial: 'z', locals: { item: @items})
end

def lp
  # Your logic to fetch data for the partial
  @items = Item.find(1)
  #render partial: 'items/partial', locals: { items: @items }
render turbo_stream: turbo_stream.append('partial_frame', partial: 'lf', locals: { item: @items})
end

def fetch_poke(xxx)
  puts xxx
  uri = URI('https://pokeapi.co/api/v2/pokemon?limit=3')
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    @pokemon_data = JSON.parse(response.body)
    @pokemon_data_which = @pokemon_data["results"][xxx]["name"]
    #session[:pd] = @pokemon_data
    flash[:success] = 'Pokemon successfully loaded!'
  else
    flash[:error] = 'Failed to load Pokemon data!'
  end
  #render turbo_stream: turbo_stream.append('tst', partial: 'poke_names', locals: { pokemon_data: @pokemon_data, item: @item})
  #render :new
end


def test
  @time = Time.now
  @items = Item.all
  @itemn = Item.new
end

  # GET /items or /items.json
  def index
    @items = Item.all
    #flash[:notice]='My Notice'
    #session[:current_item] = @items[1][:name]
  end

  # GET /items/1 or /items/1.json
  def show
    session[:last_item] = Item.find(params[:id])
    session[:last_item_name] = Item.find(params[:id])
    @alla = Item.pluck('body')
  end

  # GET /items/new
  def new
    if params["zomg"]
      @zomg = params[:zomg].to_i
    else
      #@zomg = 2
  end
    puts 'zomg', @zomg  
    #params[:zz]='hi'
    @item = Item.new item_params
    #ItemsController.dispatch(:fetch_poke, request, response)
    puts params[:item].inspect
    p params[:item][:body].to_i if params[:item]
    if params["item"]
      p "fetch_poke #{params[:zomg].inspect}"
      p params[:item][:body].to_i
      #fetch_poke(params[:item][:name].to_i) if params["item"]["access"] == 'poke'
      fetch_poke(params[:item][:zomg].to_i) if params["item"]["access"] == 'poke'
      #debugger
    end
    #fetch_poke if item.poke?
    puts params[:zomg].inspect
    #fetch_poke if params[:fetch_pokemon] == "true" && @item.passcode_protected? # Fetch Pokémon data if item is passcode protected and fetch_pokemon parameter is true    set_default_password if @item.passcode_protected? # Set default password

    #params[:aa]="aa" if @pokemon_data
    #@item[:name] = session[:last_item]["name"]
    #puts session[:last_item][:name].inspect
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @items = Item.all

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_default_password
  # Set the password to "bulbasaur" or @poke_data["results][0]["name"]
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.fetch(:item, {}).permit(:name, :body, :access, :pass)
    end
end
