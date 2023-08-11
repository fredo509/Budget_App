class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    if @category.author != current_user
      flash[:alert] = 'Access Not Allowed !'
      redirect_to categories_path
    end
    @transaction = @category.transactions.order(created_at: :desc)
    @total_amount = @transaction.sum(:amount)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.author = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created :)" }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon)
    end
end
