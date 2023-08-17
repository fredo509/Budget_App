class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = Transaction.where(category_id: @category.id).order(id: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  # POST /items
  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build(transaction_params)

    @transaction.author_id = current_user.id

    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction added successfully'
    else
      render :new, alert: 'Failed to add transaction'
    end
  end

  # DELETE /items/1
  def destroy
    @transaction = Transaction.find(params[:id])

    if @transaction.destroy
      redirect_to Category_transactions_path, notice: 'Transaction removed successfully'
    else
      render :index, alert: 'Failed to remove Transaction'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @item = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
