def new
    #if params[:zomg]
      @zomg = params[:zomg].to_1
    #else
      #@zomg = 1 
    #end
    puts 'zomg', @zomg  
    #params[:zz]='hi'
    @item = Item.new item_params
    #ItemsController.dispatch(:fetch_poke, request, response)
    if params["item"]
      if @zomg == 0
        fetch_poke(0) if params["item"]["access"] == 'poke'
      elsif @zomg == 2
        fetch_poke(2) if params["item"]["access"] == 'poke'
      else
        fetch_poke(1) if params["item"]["access"] == 'poke'
      end
    end
    #fetch_poke if item.poke?
    puts params[:item].inspect
    #fetch_poke if params[:fetch_pokemon] == "true" && @item.passcode_protected? # Fetch Pokémon data if item is passcode protected and fetch_pokemon parameter is true    set_default_password if @item.passcode_protected? # Set default password

    #params[:aa]="aa" if @pokemon_data
    #@item[:name] = session[:last_item]["name"]
    #puts session[:last_item][:name].inspect
  end