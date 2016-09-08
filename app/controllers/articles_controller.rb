class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    #This displays the params hash data in the browser
    @article = Article.new(article_params)
    #pulls the specified attributes from params with private method from bottom of page 
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new 
      #could also be 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  #private
  def article_params
    params.require(:article).permit(:title, :description)
    #this is the secret method that stores the attributes we want to save and gets passed to the CREATE action.
  end
end