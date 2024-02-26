class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

require 'uri'
require 'net/http'

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
  end

  # GET /pokemons/new
def new
  #@data = nil
  @abc=1
  @pokemon = Pokemon.new
  if params[:fetch_pokemon].present?
    @abc+=1
    fetchpokemon(@pokemon) 
    p @first_pokemon_name.inspect
    p @data["results"][0].inspect
  end
end

def fetchpokemon(pokemon)
  # Make HTTP request to fetch Pokémon data
  url = URI("https://pokeapi.co/api/v2/pokemon?limit=7")
  
  response = Net::HTTP.get(url)
  @data = JSON.parse(response)

  # Extract the name of the first Pokémon from the data
  @first_pokemon_name = @data["results"][params[:fetch_pokemon].to_i]["name"]
  @sel_poke = @data["results"][params[:fetch_pokemon].to_i]

  # Set the attributes of the pokemon to the name of the first Pokémon
  pokemon.name = @first_pokemon_name
  puts params[:fetch_pokemon].to_i.class.inspect

  # Fetch Pokemon names and store them in `pokemon_names` array
p 'each'
pokemon_names = @data["results"].map { |result| result["name"] }
#p pokemon_names

#INDIVIDUAL POKEMON DATA FETCHING
url = URI("https://pokeapi.co/api/v2/pokemon/#{params[:fetch_pokemon].to_i}/")
  
response = Net::HTTP.get(url)
@dataz = JSON.parse(response)

# Dynamically define the enum using the fetched Pokemon names
#Pokemon.define_pokemon_enum(pokemon_names)


  # Render the form with updated data using Turbo Streams
  #render turbo_stream: turbo_stream.append('partial_frame', partial: 'forma')
end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons or /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1 or /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1 or /pokemons/1.json
  def destroy
    @pokemon.destroy!

    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: "Pokemon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :url, :category)
    end
end
