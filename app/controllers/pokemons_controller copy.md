class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

require 'uri'
# require 'net/http'

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
  end

  # GET /pokemons/new
def new
  @pokemon = Pokemon.new
  fetchpokemon(@pokemon) if params[:fetch_pokemon].present?
end

def fetchpokemon(pokemon)
  # Make HTTP request to fetch Pokémon data
  url = URI("https://pokeapi.co/api/v2/pokemon/")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  # Extract the name of the first Pokémon from the data
  first_pokemon_name = data["results"][0]["name"]

  # Set the attributes of the pokemon to the name of the first Pokémon
  pokemon.name = first_pokemon_name

  # Render the form with updated data using Turbo Streams
  render turbo_stream: turbo_stream.append('partial_frame', partial: 'forma')
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
