class UsersController < ApplicationController
  def show_bookmarked_deputies
    a = current_user.id
    @user = User.find(a)
    

    render("users/show_bookmarked_deputies.html.erb")
  end

  def show_bookmarked_senators
    a = current_user.id
    @user = User.find(a)

    render("users/show_bookmarked_senators.html.erb")
  end

end
