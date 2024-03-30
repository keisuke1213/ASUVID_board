class CarendersController < ApplicationController
  def top
    @posts = Post.all
  end
end
