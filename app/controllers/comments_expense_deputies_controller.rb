class CommentsExpenseDeputiesController < ApplicationController
  def index
    @comments_expense_deputies = CommentsExpenseDeputy.all

    render("comments_expense_deputies/index.html.erb")
  end

  def show
    @comments_expense_deputy = CommentsExpenseDeputy.find(params[:id])

    render("comments_expense_deputies/show.html.erb")
  end

  def new
    @comments_expense_deputy = CommentsExpenseDeputy.new

    render("comments_expense_deputies/new.html.erb")
  end

  def create
    @red_flag_expense_deputy = RedFlagExpenseDeputy.new

    @red_flag_expense_deputy.user_id = params[:user_id]
    @red_flag_expense_deputy.deputy_id = params[:deputy_id]
    @red_flag_expense_deputy.expense_description = params[:expense_description]
    @red_flag_expense_deputy.expense_detail = params[:expense_detail]
    @red_flag_expense_deputy.expense_amount = params[:expense_amount]

    save_status = @red_flag_expense_deputy.save

    @comments_expense_deputy = CommentsExpenseDeputy.new

    @comments_expense_deputy.user_id = params[:user_id]
    @comments_expense_deputy.body = params[:body]
    @comments_expense_deputy.red_flag_expense_deputy_id = @red_flag_expense_deputy.id
    @comments_expense_deputy.deputy_id = params[:deputy_id]

    save_status = @comments_expense_deputy.save

    if save_status == true
      redirect_to("/deputies/#{@red_flag_expense_deputy.deputy_id}/expenses", :notice => "Comments expense deputy created successfully.")
    else
      render("comments_expense_deputies/new.html.erb")
    end
  end

  def create_comment

    @comments_expense_deputy = CommentsExpenseDeputy.new

    @comments_expense_deputy.user_id = params[:user_id]
    @comments_expense_deputy.body = params[:body]
    @comments_expense_deputy.red_flag_expense_deputy_id = params[:red_flag_expense_deputy_id]
    @comments_expense_deputy.deputy_id = params[:deputy_id]

    save_status = @comments_expense_deputy.save

    if save_status == true
      redirect_to("/red_flag_expense_deputies_senators", :notice => "Comments expense deputy created successfully.")
    else
      render("comments_expense_deputies/new.html.erb")
    end
  end

  def edit
    @comments_expense_deputy = CommentsExpenseDeputy.find(params[:id])

    render("comments_expense_deputies/edit.html.erb")
  end

  def update
    @comments_expense_deputy = CommentsExpenseDeputy.find(params[:id])

    @comments_expense_deputy.user_id = params[:user_id]
    @comments_expense_deputy.body = params[:body]
    @comments_expense_deputy.red_flag_expense_deputy_id = params[:red_flag_expense_deputy_id]
    @comments_expense_deputy.deputy_id = params[:deputy_id]

    save_status = @comments_expense_deputy.save

    if save_status == true
      redirect_to("/comments_expense_deputies/#{@comments_expense_deputy.id}", :notice => "Comments expense deputy updated successfully.")
    else
      render("comments_expense_deputies/edit.html.erb")
    end
  end

  def destroy
    @comments_expense_deputy = CommentsExpenseDeputy.find(params[:id])

    @comments_expense_deputy.destroy

    if URI(request.referer).path == "/comments_expense_deputies/#{@comments_expense_deputy.id}"
      redirect_to("/", :notice => "Comments expense deputy deleted.")
    else
      redirect_to(:back, :notice => "Comments expense deputy deleted.")
    end
  end
end
