class HomeController < ApplicationController

	def index	
    @posts = Post.find(:all, :order => "created_at")
  end


end