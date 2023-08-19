class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories.includes(:transactions).order(id: :desc)
  end

  def show
    @category = Category.find(params[:id])
    if @category.author != current_user
      flash[:alert] = 'Not authorized dude!'
      redirect_to categories_path
    end
    @transactions = Transaction.where(category_id: params[:id])
    @total_amount = Transaction.where(category_id: @category.id).sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user

    if @category.save
      flash[:notice] = 'Category successfully created'
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
   @user = current_user
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_path, notice: 'Category removed !'
    else
      render :index, alert: 'Failed to remove category'
    end
  end  

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end