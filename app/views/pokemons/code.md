### JAVASCRIPT 
## FORM
<%= form_with(url: pokemons_path, method: :post) do |form| %>
  <div class="field">
    <%= form.label :access %>
    <%= form.select :access, Pokemon.accesses, prompt: "Select Pokemon Type", id: "pokemon-access" %>
  </div>
  
  <div class="field" id="sub-access" style="display: none;">
    <%= form.label :sub_access %>
    <%= form.select :sub_access, Pokemon.sub_accesses.keys.map { |sub_access| [sub_access.titleize, sub_access] }, prompt: "Select Pokemon Species", id: "pokemon-sub-access" %>
  </div>

  <%= form.submit %>
<% end %>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var accessSelect = document.getElementById("access");
    var subAccessDiv = document.getElementById("sub-access");

    accessSelect.addEventListener("change", function() {
      var selectedAccess = this.value;
      if (selectedAccess === "poke") {
        subAccessDiv.style.display = "block";
        console.log('poke')
      } else {
        subAccessDiv.style.display = "none";
      }
    });
  });
</script>
### <= JAVASCRIPT END


### ALPINE
<%= form_with(url: pokemons_path, method: :post) do |form| %>
  <div x-data="{ showSubAccess: false }">
    <div class="field">
      <%= form.label :access %>
      <%= form.select :access, Pokemon.accesses, { prompt: "Select Pokemon Type", id: "pokemon-access" }, { '@change' => "showSubAccess = ($event.target.value === 'poke')" } %>
    </div>
    
    <div class="field" id="sub-access" x-show="showSubAccess">
      <%= form.label :sub_access %>
      <%= form.select :sub_access, Pokemon.sub_accesses.keys.map { |sub_access| [sub_access.titleize, sub_access] }, { prompt: "Select Pokemon Species", id: "pokemon-sub-access" } %>
    </div>
  </div>



### <= ALPINE END

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var accessSelect = document.getElementById("access");
    var subAccessDiv = document.getElementById("sub-access");

    accessSelect.addEventListener("change", function() {
      var selectedAccess = this.value;
      if (selectedAccess === "poke") {
        subAccessDiv.style.display = "block";
      } else {
        subAccessDiv.style.display = "none";
      }
    });
  });
</script>


<%= form_with(url: "/pokemons/new", method: :get) do |form| %>
  <%= form.select :fetch_pokemon, Pokemon.accesses %>
  <%#= form.submit %>
  <%#= form.submit nil %>
  <%= form.submit "Fetch Pokémon", name: nil %>

<% end %>

<%= turbo_frame_tag 'gto' do %>
  <!-- This content will be replaced by the partial -->
  <% if @abc==2 %>
    <%= turbo_stream.update "gto", "Pas" %>
    <%= turbo_stream.update "gto", @pokemon.url = @first_pokemon_name %>
    <["name"]%= turbo_stream.update "gto", @pokemon.url = @first_pokemon_name %>@data["results"][0]
  <% end %>
<% end %>


<%= turbo_frame_tag 'gto' do %>
  <!-- This content will be replaced by the partial -->
  <% if @data %>
    <% @data['results'].each do |result| %>
      <%= turbo_stream.append "gto", result['name'] + result['url'] %>
    <% end %>
    <%#= turbo_stream.update "gto", @pokemon.category = @first_pokemon_name %>
    <%#= turbo_stream.update "gto", @pokemon.url = @data["results"][0]["url"] %>
  <% end %>
<% end %>


  <% if @data %>
    <%= turbo_stream.append "gto" do %>
      <% @data['results'].each do |result| %>
        Name: <%= result['name'] %><br>
        Url: <%= result['url'] %><br>
      <% end %>
    <% end %>
  <% end %>
<% end %>




<%= turbo_frame_tag 'gto' do %>
  <!-- This content will be replaced by the partial -->
  <% if @data %>
    <%= turbo_stream.update "gto", @pokemon.category = '' %>
    <%= turbo_stream.update "gto", @pokemon.url = @data["results"][0]["url"] %>
    <%= turbo_stream.append "gto" do %>
      <% @data['results'].each do |result| %>
        Name: <%= result['name'] %><br>
        Url: <%= result['url'] %><br>
        <%= link_to "Update gta", "#", class: "update-gta", "data-turbo-frame": "gta", "data-turbo-stream": "replace", "data-turbo-target": "gta", "data-turbo-action": "replace", onclick: "document.getElementById('pokemon_category').value = 'Hi'" %><br>
      <% end %>
    <% end %>
  <% end %>
<% end %>
