class RedFlagExpenseDeputiesController < ApplicationController
  def index
    @red_flag_expense_deputies = RedFlagExpenseDeputy.all

    render("red_flag_expense_deputies/index.html.erb")
  end

  def index_all
    @red_flags_deputies = RedFlagExpenseDeputy.all
    @red_flags_senators = RedFlagExpenseSenator.all

    render("red_flag_expense_deputies/index_all.html.erb")
  end

  def show
    @red_flag_expense_deputy = RedFlagExpenseDeputy.find(params[:id])

    render("red_flag_expense_deputies/show.html.erb")
  end

  def show_red_flags_deputy
    @deputies = Deputy.all
    @deputy_id = params[:deputy_id]
    @red_flags_deputies = RedFlagExpenseDeputy.where({:deputy_id => @deputy_id})



    render("red_flag_expense_deputies/show_red_flags_deputy.html.erb")
  end

  def new
    @red_flag_expense_deputy = RedFlagExpenseDeputy.new

    render("red_flag_expense_deputies/new.html.erb")
  end

  def create
    @red_flag_expense_deputy = RedFlagExpenseDeputy.new

    @red_flag_expense_deputy.user_id = params[:user_id]
    @red_flag_expense_deputy.deputy_id = params[:deputy_id]
    @red_flag_expense_deputy.expense_description = params[:expense_description]
    @red_flag_expense_deputy.expense_detail = params[:expense_detail]
    @red_flag_expense_deputy.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_deputy.save

    if save_status == true
      redirect_to("/deputies/#{@red_flag_expense_deputy.deputy_id}/expenses", :notice => "Red flag expense deputy created successfully.")
    else
      render("red_flag_expense_deputies/new.html.erb")
    end
  end

  def edit
    @red_flag_expense_deputy = RedFlagExpenseDeputy.find(params[:id])

    render("red_flag_expense_deputies/edit.html.erb")
  end

  def update
    @red_flag_expense_deputy = RedFlagExpenseDeputy.find(params[:id])

    @red_flag_expense_deputy.user_id = params[:user_id]
    @red_flag_expense_deputy.deputy_id = params[:deputy_id]
    @red_flag_expense_deputy.expense_description = params[:expense_description]
    @red_flag_expense_deputy.expense_detail = params[:expense_detail]
    @red_flag_expense_deputy.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_deputy.save

    if save_status == true
      redirect_to("/red_flag_expense_deputies/#{@red_flag_expense_deputy.id}", :notice => "Red flag expense deputy updated successfully.")
    else
      render("red_flag_expense_deputies/edit.html.erb")
    end
  end

  def destroy
    @red_flag_expense_deputy = RedFlagExpenseDeputy.find(params[:id])

    @red_flag_expense_deputy.destroy

    if URI(request.referer).path == "/red_flag_expense_deputies/#{@red_flag_expense_deputy.id}"
      redirect_to("/", :notice => "Red flag expense deputy deleted.")
    else
      redirect_to(:back, :notice => "Red flag expense deputy deleted.")
    end
  end
end
