class CommentsExpenseSenatorsController < ApplicationController
  def index
    @comments_expense_senators = CommentsExpenseSenator.all

    render("comments_expense_senators/index.html.erb")
  end

  def show
    @comments_expense_senator = CommentsExpenseSenator.find(params[:id])

    render("comments_expense_senators/show.html.erb")
  end

  def new
    @comments_expense_senator = CommentsExpenseSenator.new

    render("comments_expense_senators/new.html.erb")
  end

  def create
    @red_flag_expense_senator = RedFlagExpenseSenator.new

    @red_flag_expense_senator.user_id = params[:user_id]
    @red_flag_expense_senator.senator_id = params[:senator_id]
    @red_flag_expense_senator.expense_description = params[:expense_description]
    @red_flag_expense_senator.expense_detail = params[:expense_detail]
    @red_flag_expense_senator.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_senator.save

    @comments_expense_senator = CommentsExpenseSenator.new

    @comments_expense_senator.user_id = params[:user_id]
    @comments_expense_senator.body = params[:body]
    @comments_expense_senator.red_flag_expense_senator_id = @red_flag_expense_senator.id
    @comments_expense_senator.senator_id = params[:senator_id]

    save_status = @comments_expense_senator.save

    if save_status == true
      redirect_to("/senators/#{@red_flag_expense_senator.senator_id}/expenses", :notice => "Comments expense senator created successfully.")
    else
      render("comments_expense_senators/new.html.erb")
    end
  end

  def create_comment

    @comments_expense_senator = CommentsExpenseSenator.new

    @comments_expense_senator.user_id = params[:user_id]
    @comments_expense_senator.body = params[:body]
    @comments_expense_senator.red_flag_expense_senator_id = params[:red_flag_expense_senator_id]
    @comments_expense_senator.senator_id = params[:senator_id]

    save_status = @comments_expense_senator.save

    if save_status == true
      redirect_to("/red_flag_expense_deputies_senators", :notice => "Comments expense senator created successfully.")
    else
      render("comments_expense_senators/new.html.erb")
    end
  end

  def edit
    @comments_expense_senator = CommentsExpenseSenator.find(params[:id])

    render("comments_expense_senators/edit.html.erb")
  end

  def update
    @comments_expense_senator = CommentsExpenseSenator.find(params[:id])

    @comments_expense_senator.user_id = params[:user_id]
    @comments_expense_senator.body = params[:body]
    @comments_expense_senator.red_flag_expense_senator_id = params[:red_flag_expense_senator_id]
    @comments_expense_senator.senator_id = params[:senator_id]

    save_status = @comments_expense_senator.save

    if save_status == true
      redirect_to("/comments_expense_senators/#{@comments_expense_senator.id}", :notice => "Comments expense senator updated successfully.")
    else
      render("comments_expense_senators/edit.html.erb")
    end
  end

  def destroy
    @comments_expense_senator = CommentsExpenseSenator.find(params[:id])

    @comments_expense_senator.destroy

    if URI(request.referer).path == "/comments_expense_senators/#{@comments_expense_senator.id}"
      redirect_to("/", :notice => "Comments expense senator deleted.")
    else
      redirect_to(:back, :notice => "Comments expense senator deleted.")
    end
  end
end
