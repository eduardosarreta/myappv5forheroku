class RedFlagExpenseSenatorsController < ApplicationController
  def index
    @red_flag_expense_senators = RedFlagExpenseSenator.all

    render("red_flag_expense_senators/index.html.erb")
  end

  def show
    @red_flag_expense_senator = RedFlagExpenseSenator.find(params[:id])

    render("red_flag_expense_senators/show.html.erb")
  end

  def show_red_flags_senator
    @senators = Senator.all
    @senator_id = params[:senator_id]
    @red_flags_senators = RedFlagExpenseSenator.where({:senator_id => @senator_id})



    render("red_flag_expense_senators/show_red_flags_senator.html.erb")
  end

  def new
    @red_flag_expense_senator = RedFlagExpenseSenator.new

    render("red_flag_expense_senators/new.html.erb")
  end

  def create
    @red_flag_expense_senator = RedFlagExpenseSenator.new

    @red_flag_expense_senator.user_id = params[:user_id]
    @red_flag_expense_senator.senator_id = params[:senator_id]
    @red_flag_expense_senator.expense_description = params[:expense_description]
    @red_flag_expense_senator.expense_detail = params[:expense_detail]
    @red_flag_expense_senator.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_senator.save

    if save_status == true
      redirect_to("/red_flag_expense_senators/#{@red_flag_expense_senator.id}", :notice => "Red flag expense senator created successfully.")
    else
      render("red_flag_expense_senators/new.html.erb")
    end
  end

  def edit
    @red_flag_expense_senator = RedFlagExpenseSenator.find(params[:id])

    render("red_flag_expense_senators/edit.html.erb")
  end

  def update
    @red_flag_expense_senator = RedFlagExpenseSenator.find(params[:id])

    @red_flag_expense_senator.user_id = params[:user_id]
    @red_flag_expense_senator.senator_id = params[:senator_id]
    @red_flag_expense_senator.expense_description = params[:expense_description]
    @red_flag_expense_senator.expense_detail = params[:expense_detail]
    @red_flag_expense_senator.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_senator.save

    if save_status == true
      redirect_to("/red_flag_expense_senators/#{@red_flag_expense_senator.id}", :notice => "Red flag expense senator updated successfully.")
    else
      render("red_flag_expense_senators/edit.html.erb")
    end
  end

  def destroy
    @red_flag_expense_senator = RedFlagExpenseSenator.find(params[:id])

    @red_flag_expense_senator.destroy

    if URI(request.referer).path == "/red_flag_expense_senators/#{@red_flag_expense_senator.id}"
      redirect_to("/", :notice => "Red flag expense senator deleted.")
    else
      redirect_to(:back, :notice => "Red flag expense senator deleted.")
    end
  end
end
