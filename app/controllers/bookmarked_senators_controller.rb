class BookmarkedSenatorsController < ApplicationController
  def index
    @bookmarked_senators = BookmarkedSenator.all
    @senators = Senator.all

    render("bookmarked_senators/index.html.erb")
  end

  def show
    @bookmarked_senator = BookmarkedSenator.find(params[:id])

    render("bookmarked_senators/show.html.erb")
  end

  def new
    @bookmarked_senator = BookmarkedSenator.new

    render("bookmarked_senators/new.html.erb")
  end

  def create
    @bookmarked_senator = BookmarkedSenator.new

    @bookmarked_senator.user_id = params[:user_id]
    @bookmarked_senator.senator_id = params[:senator_id]

    save_status = @bookmarked_senator.save

    if save_status == true
      redirect_to("/senators", :notice => "Senator bookmarked successfully.")
    else
      render("bookmarked_senators/new.html.erb")
    end
  end

  def edit
    @bookmarked_senator = BookmarkedSenator.find(params[:id])

    render("bookmarked_senators/edit.html.erb")
  end

  def update
    @bookmarked_senator = BookmarkedSenator.find(params[:id])

    @bookmarked_senator.user_id = params[:user_id]
    @bookmarked_senator.senator_id = params[:senator_id]

    save_status = @bookmarked_senator.save

    if save_status == true
      redirect_to("/bookmarked_senators/#{@bookmarked_senator.id}", :notice => "Bookmarked senator updated successfully.")
    else
      render("bookmarked_senators/edit.html.erb")
    end
  end

  def destroy
    @bookmarked_senator = BookmarkedSenator.find(params[:id])

    @bookmarked_senator.destroy

    if URI(request.referer).path == "/bookmarked_senators/#{@bookmarked_senator.id}"
      redirect_to("/", :notice => "Bookmarked senator deleted.")
    else
      redirect_to(:back, :notice => "Bookmarked senator deleted.")
    end
  end
end
