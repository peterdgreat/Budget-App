class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show edit update destroy]

  # GET /spendings or /spendings.json
  def index
    @spendings = Spending.where(user: current_user)
    @groups = Group.where(user: current_user)
    @total_spending = @spendings.all.sum(:amount)
  end

  # GET /spendings/1 or /spendings/1.json
  def show; end

  # GET /spendings/new
  def new
    @spending = current_user.spendings.new

    @groups = Group.where(user: current_user)
  end

  # GET /spendings/1/edit
  def edit
    @groups = Group.where(user: current_user)
  end

  # POST /spendings or /spendings.json
  def create
    @groups = Group.where(user: current_user)
    @spending = Spending.new(user_id: spending_params[:user_id], name: spending_params[:name],
                             amount: spending_params[:amount])

    respond_to do |format|
      if @spending.save
        params[:spending][:group_id].each do |group_id|
          puts group_id
          GroupSpending.create!(group_id: group_id.to_i, spending_id: @spending.id)
        end
        format.html { redirect_to spending_url(@spending), notice: 'Spending was successfully created.' }
        format.json { render :show, status: :created, location: @spending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spendings/1 or /spendings/1.json
  def update
    respond_to do |format|
      if @spending.update(spending_params)
        format.html { redirect_to spending_url(@spending), notice: 'Spending was successfully updated.' }
        format.json { render :show, status: :ok, location: @spending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spendings/1 or /spendings/1.json
  def destroy
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to spendings_url, notice: 'Spending was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spending
    @spending = Spending.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spending_params
    params.require(:spending).permit(:name, :amount, :user_id, :group_id)
  end
end
