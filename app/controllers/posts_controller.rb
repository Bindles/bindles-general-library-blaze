class PostsController < ApplicationController
  def index
    @page = params[:page] || 1
    @posts = Post.page(@page)
    puts "Total count before sorting: #{Post.count}  #{@page}"
    @posts = @posts.order(body: :asc) # Or any other sorting method
    puts "Total count after sorting: #{Post.count}"
  end
end


#IGNORE, DOESNT WORK, doesnt scroll
#@posts = Post.page(@page).sort { |a,b| a[:body] <=> b[:body] }
