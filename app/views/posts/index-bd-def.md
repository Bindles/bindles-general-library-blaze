<!--
<h1 class="font-bold mb-4 text-xl">Posts</h1>
<hr class="mb-4" />
<div id="posts" class="grid grid-cols-12 gap-4"
  data-controller="pagination"
  data-pagination-target="posts"
  data-pagination-url-value="<%= posts_url %> "
  data-pagination-page-value="<%= 2 %>">
    <%= render @posts %>
</div>
-->



<div>
  <h1 class="font-bold text-4xl">Posts#index</h1>
  <p>Find me in app/views/posts/index.html.erb</p>

  <%= turbo_stream_from :posts %>
  <div id="posts">
    <%= render @posts %>
  </div>
</div>
