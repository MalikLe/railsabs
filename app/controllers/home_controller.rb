class HomeController < ApplicationController
  def index
  end

  def about
  end


  def select
  	@groups = Group.all
  end
end
