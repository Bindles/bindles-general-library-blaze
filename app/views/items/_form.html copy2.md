<%= form_with(model: item, class: "contents") do |form| %>
  <% if item.errors.any? %>
    <div id="error_explanation" class="bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3">
      <h2><%= pluralize(item.errors.count, "error") %> prohibited this item from being saved:</h2>

      <ul>
        <% item.errors.each do |error| %>
          <li><%= error.full_message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
    <%= form.button "Validate", formaction: new_item_path, formmethod: :get, data: { turbo_frame: :pass_field, formelement_target: "submitbtn" } %>
  <%# <div class="my-5"> %>
  <div data-controller="formelement">
    <%= form.button "Validate", formaction: fetch_poke_path, formmethod: :get, data: { turbo_frame: :pass_field, formelement_target: "submitbtn" } %>

    <div class="my-5">
      <%= form.label :name %>
      <%= form.text_field :name, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
    </div>

    <div class="my-5">
      <%= form.label :body %>
      <%= form.text_area :body, rows: 4, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
    </div>
  

  <div class="my-5">
    <%= form.label :access, style: "display: block" %>
    <%= form.select :access, Item.accesses, {include_blank: true}, { data: { action: "change->formelement#remotesubmit"}} %>
    <%#= form.select :access, Post.accesses, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
  </div>
  </div>

<div id="tst">

</div>

  <%= item.passcode_protected? %>

  <%= turbo_frame_tag :pass_field do %>
    <% if params[:aa]=='aa'%>
    <%# if item.passcode_protected?%>
      <%#= turbo_stream.update "tst", item.pass = @item.name + ' updated at ' + Time.zone.now.to_s + params.inspect%>
      <%= turbo_stream.update "tst", item.pass = session[:pd].inspect %>
    <% end %>
      <div class="my-5">
        <%= form.label :pass %>
        <%= form.text_field :pass, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>
      </div>
    <%# end %>
    
  <% end %>

  <div class="inline">
    <%= form.submit class: "rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>
  </div>
<% end %>
