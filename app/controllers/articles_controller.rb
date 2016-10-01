class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    set_article
  end
  
  def edit
    set_article
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain: params[:article].inspect
    #This displays the params hash data in the browser
    @article = Article.new(article_params)
    @article.user = User.first
    #pulls the specified attributes from params with private method from bottom of page 
    if @article.save
      flash[:info] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new 
      #could also be 'new'
    end
  end
  
  def update
    set_article
    if @article.update(article_params)
      flash[:info] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  def destroy
    set_article
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  #private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
    #this is the secret method that stores the attributes we want to save and gets passed to the CREATE action.
  end
  
  def require_same_user
    if current_user != @article.user
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path 
    end
  end
end