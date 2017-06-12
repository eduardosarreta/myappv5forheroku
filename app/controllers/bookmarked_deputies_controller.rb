class BookmarkedDeputiesController < ApplicationController
  def index
    @bookmarked_deputies = BookmarkedDeputy.all
    @deputies = Deputy.all

    render("bookmarked_deputies/index.html.erb")
  end

  def show
    @bookmarked_deputy = BookmarkedDeputy.find(params[:id])

    render("bookmarked_deputies/show.html.erb")
  end

  def new
    @bookmarked_deputy = BookmarkedDeputy.new

    render("bookmarked_deputies/new.html.erb")
  end

  def create
    @bookmarked_deputy = BookmarkedDeputy.new

    @bookmarked_deputy.user_id = params[:user_id]
    @bookmarked_deputy.deputy_id = params[:deputy_id]

    save_status = @bookmarked_deputy.save

    if save_status == true
      redirect_to("/deputies", :notice => "Deputy bookmarked successfully.")
    else
      render("bookmarked_deputies/new.html.erb")
    end
  end

  def edit
    @bookmarked_deputy = BookmarkedDeputy.find(params[:id])

    render("bookmarked_deputies/edit.html.erb")
  end

  def update
    @bookmarked_deputy = BookmarkedDeputy.find(params[:id])

    @bookmarked_deputy.user_id = params[:user_id]
    @bookmarked_deputy.deputy_id = params[:deputy_id]

    save_status = @bookmarked_deputy.save

    if save_status == true
      redirect_to("/bookmarked_deputies/#{@bookmarked_deputy.id}", :notice => "Bookmarked deputy updated successfully.")
    else
      render("bookmarked_deputies/edit.html.erb")
    end
  end

  def destroy
    @bookmarked_deputy = BookmarkedDeputy.find(params[:id])

    @bookmarked_deputy.destroy

    if URI(request.referer).path == "/bookmarked_deputies/#{@bookmarked_deputy.id}"
      redirect_to("/", :notice => "Bookmarked deputy deleted.")
    else
      redirect_to(:back, :notice => "Bookmarked deputy deleted.")
    end
  end
end
