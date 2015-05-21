class ArticlesController < ApplicationController
  #before_action :confirm_logged_in
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
  	#on the main dashboard page we want to be able to see a list of all our published articles by the signed in author
  	#temp_id = 1
  	#@articles = Article.where(:author_id => temp_id)#session[:author_id])
    @articles = Article.all

  end

  def new
  	#present a page where the author can write a new article
  	@article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
  	#processes the new article and saves it in the database
  	@article = Article.new(article_params)
  	if @article.save
  		#article successfully saved
  		flash[:notice] = "New article saved successfully"
  		#redirect_to(:action => 'index')
      redirect_to @article
  	else
  		#a problem occured
  		flash[:notice] = "Sorry a problem has occured when saving this new article"
  		render('new')
  	end
  end



  def edit
  	#same layout as a new article but with loaded variables from the database
  	@article = Article.find(params[:id])
  end

  def update
  	#updates the database version of the article
  	#finds article to update
  	@article = Article.find(params[:id])
  	#check to see if we can update the article
  	if @article.update(article_params) 
  		#successfully updated
  		flash[:notice] = "'#{@article.title}' has been successfully updated"
  		redirect_to @article
  	else
  		#problem occured
  		flash[:notice] = "Sorry, there was a problem updating '#{@article.title}'"
  		render('edit')
  	end
  end

  def delete
  	#checks to make sure the user really wants to delete a particular article
  	@article = Article.find(params[:id])
  end

  def destroy
  	#destroys a particular record in the database based on what delete has shown the user
  	@article = Article.find(params[:id])
  	@article.destroy
  	flash[:notice] = "#{@article.title} has been permanently deleted"
    redirect_to articles_path
  end

  private

  def article_params
  	#check to ensure only the appropriate values are in the object that has come from the form
  	#we check the params to 'require' a certain object and then permit only certain fields
  	params.require(:article).permit(:author_id, :title, :subhead, :content, :permalink, :comments_enabled)
  end
end
