class PublicController < ApplicationController
  def index
  	#shows a list of the articles like the front page of a blog
  	@articles = Article.sorted
  end

  def show
  	#shows a particular page in full and alone
  	@article = Article.find(:permalink => params[:permalink])
  end
end
