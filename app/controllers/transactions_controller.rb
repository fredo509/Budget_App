class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @category = Category.find(params[:category_id])
    return unless @category.author != current_user
  end

  # POST /transactions or /transactions.json
  def create
    @category = Category.find(params[:category_id])
    if @category = Category.find(params[:category_id])
      @Transaction = Transaction.new(transaction_params)
      @transaction.author = current_user
    end
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :amount, category_ids: [])
    end
end
