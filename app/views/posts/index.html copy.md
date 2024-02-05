<h1 class="font-bold mb-4 text-xl">Posts</h1>
<hr class="mb-4" />
<div id="posts" class="grid grid-cols-12 gap-4"
  data-controller="pagination"
  data-pagination-target="posts"
  data-pagination-url-value="<%= posts_url %> "
  data-pagination-page-value="<%= 2 %>">
    <%= render @posts %>
</div>
