class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5) #standard pagination implementation 
  end
  
  def show
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:info] = "Category successfully created"
      redirect_to categories_path
    else
      render :new
    end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      # if not logged in || logged in but not the admin
      flash[:danger] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end
  
end


