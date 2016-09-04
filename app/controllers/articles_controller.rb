class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    #This displays the params hash data in the browser
    @article = Article.new(article_params)
    #pulls the specified attributes from params with private method from bottom of page 
    @article.save
  end
  
  
  #private
  def article_params
    params.require(:article).permit(:title, :description)
    #this is the secret method that stores the attributes we want to save and gets passed to the CREATE action.
  end
end