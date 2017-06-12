Rails.application.routes.draw do


  # Routes for the Comments_expense_senator resource:
  # CREATE
  get "/comments_expense_senators/new", :controller => "comments_expense_senators", :action => "new"
  post "/create_comments_expense_senator", :controller => "comments_expense_senators", :action => "create"
  post "/create_comments_expense_senator_in_existing_red_flag", :controller => "comments_expense_senators", :action => "create_comment"

  # READ
  get "/comments_expense_senators", :controller => "comments_expense_senators", :action => "index"
  get "/comments_expense_senators/:id", :controller => "comments_expense_senators", :action => "show"

  # UPDATE
  get "/comments_expense_senators/:id/edit", :controller => "comments_expense_senators", :action => "edit"
  post "/update_comments_expense_senator/:id", :controller => "comments_expense_senators", :action => "update"

  # DELETE
  get "/delete_comments_expense_senator/:id", :controller => "comments_expense_senators", :action => "destroy"
  #------------------------------

  # Routes for the Comments_expense_deputy resource:
  # CREATE
  get "/comments_expense_deputies/new", :controller => "comments_expense_deputies", :action => "new"
  post "/create_comments_expense_deputy", :controller => "comments_expense_deputies", :action => "create"
  post "/create_comments_expense_deputy_in_existing_red_flag", :controller => "comments_expense_deputies", :action => "create_comment"

  # READ
  get "/comments_expense_deputies", :controller => "comments_expense_deputies", :action => "index"
  get "/comments_expense_deputies/:id", :controller => "comments_expense_deputies", :action => "show"

  # UPDATE
  get "/comments_expense_deputies/:id/edit", :controller => "comments_expense_deputies", :action => "edit"
  post "/update_comments_expense_deputy/:id", :controller => "comments_expense_deputies", :action => "update"

  # DELETE
  get "/delete_comments_expense_deputy/:id", :controller => "comments_expense_deputies", :action => "destroy"
  #------------------------------

  # Routes for the Red_flag_expense_senator resource:
  # CREATE
  get "/red_flag_expense_senators/new", :controller => "red_flag_expense_senators", :action => "new"
  post "/create_red_flag_expense_senator", :controller => "red_flag_expense_senators", :action => "create"

  # READ
  get "/red_flag_expense_senators", :controller => "red_flag_expense_senators", :action => "index"
  get "/red_flag_expense_senators/:id", :controller => "red_flag_expense_senators", :action => "show"
  get "/show_red_flag_expense_senators/:senator_id", :controller => "red_flag_expense_senators", :action => "show_red_flags_senator"

  # UPDATE
  get "/red_flag_expense_senators/:id/edit", :controller => "red_flag_expense_senators", :action => "edit"
  post "/update_red_flag_expense_senator/:id", :controller => "red_flag_expense_senators", :action => "update"

  # DELETE
  get "/delete_red_flag_expense_senator/:id", :controller => "red_flag_expense_senators", :action => "destroy"
  #------------------------------

  # Routes for the Red_flag_expense_deputy resource:
  # CREATE
  get "/red_flag_expense_deputies/new", :controller => "red_flag_expense_deputies", :action => "new"
  post "/create_red_flag_expense_deputy", :controller => "red_flag_expense_deputies", :action => "create"

  # READ
  get "/red_flag_expense_deputies", :controller => "red_flag_expense_deputies", :action => "index"
  get "/red_flag_expense_deputies_senators", :controller => "red_flag_expense_deputies", :action => "index_all"
  get "/red_flag_expense_deputies/:id", :controller => "red_flag_expense_deputies", :action => "show"
  get "/show_red_flag_expense_deputies/:deputy_id", :controller => "red_flag_expense_deputies", :action => "show_red_flags_deputy"

  # UPDATE
  get "/red_flag_expense_deputies/:id/edit", :controller => "red_flag_expense_deputies", :action => "edit"
  post "/update_red_flag_expense_deputy/:id", :controller => "red_flag_expense_deputies", :action => "update"

  # DELETE
  get "/delete_red_flag_expense_deputy/:id", :controller => "red_flag_expense_deputies", :action => "destroy"
  #------------------------------

  root 'deputies#index'
  # Routes for the Bookmarked_senator resource:
  # CREATE
  get "/bookmarked_senators/new", :controller => "bookmarked_senators", :action => "new"
  post "/create_bookmarked_senator", :controller => "bookmarked_senators", :action => "create"

  # READ
  get "/bookmarked_senators", :controller => "bookmarked_senators", :action => "index"
  get "/bookmarked_senators/:id", :controller => "bookmarked_senators", :action => "show"


  # UPDATE
  get "/bookmarked_senators/:id/edit", :controller => "bookmarked_senators", :action => "edit"
  post "/update_bookmarked_senator/:id", :controller => "bookmarked_senators", :action => "update"

  # DELETE
  get "/delete_bookmarked_senator/:id", :controller => "bookmarked_senators", :action => "destroy"
  #------------------------------

  # Routes for the Bookmarked_deputy resource:
  # CREATE
  get "/bookmarked_deputies/new", :controller => "bookmarked_deputies", :action => "new"
  post "/create_bookmarked_deputy", :controller => "bookmarked_deputies", :action => "create"

  # READ
  get "/bookmarked_deputies", :controller => "bookmarked_deputies", :action => "index"
  get "/bookmarked_deputies/:id", :controller => "bookmarked_deputies", :action => "show"

  # UPDATE
  get "/bookmarked_deputies/:id/edit", :controller => "bookmarked_deputies", :action => "edit"
  post "/update_bookmarked_deputy/:id", :controller => "bookmarked_deputies", :action => "update"

  # DELETE
  get "/delete_bookmarked_deputy/:id", :controller => "bookmarked_deputies", :action => "destroy"
  #------------------------------

  # Routes for the State resource:
  # CREATE
  get "/states/new", :controller => "states", :action => "new"
  post "/create_state", :controller => "states", :action => "create"

  # READ
  get "/states", :controller => "states", :action => "index"
  get "/states/:name", :controller => "states", :action => "show"
  get "/states/:id/deputies", :controller => "states", :action => "show_deputies"
  get "/states/:id/senators", :controller => "states", :action => "show_senators"

  # UPDATE
  get "/states/:id/edit", :controller => "states", :action => "edit"
  post "/update_state/:id", :controller => "states", :action => "update"

  # DELETE
  get "/delete_state/:id", :controller => "states", :action => "destroy"
  #------------------------------

  # Routes for the Party resource:
  # CREATE
  get "/parties/new", :controller => "parties", :action => "new"
  post "/create_party", :controller => "parties", :action => "create"

  # READ
  get "/parties", :controller => "parties", :action => "index"
  get "/parties/:id", :controller => "parties", :action => "show"
  get "/parties/:id/deputies", :controller => "parties", :action => "show_deputies"
  get "/parties/:id/senators", :controller => "parties", :action => "show_senators"

  # UPDATE
  get "/parties/:id/edit", :controller => "parties", :action => "edit"
  post "/update_party/:id", :controller => "parties", :action => "update"

  # DELETE
  get "/delete_party/:id", :controller => "parties", :action => "destroy"
  #------------------------------

  # Routes for the Senator resource:
  # CREATE
  get "/senators/new", :controller => "senators", :action => "new"
  post "/create_senator", :controller => "senators", :action => "create"

  # READ
  get "/senators", :controller => "senators", :action => "index"
  get "/senators/:id", :controller => "senators", :action => "show"
  get "/senators/:id/expenses", :controller => "senators", :action => "show_expenses"

  # UPDATE
  get "/senators/:id/edit", :controller => "senators", :action => "edit"
  post "/update_senator/:id", :controller => "senators", :action => "update"

  # DELETE
  get "/delete_senator/:id", :controller => "senators", :action => "destroy"
  #------------------------------

  # Routes for the Deputy resource:
  # CREATE
  get "/deputies/new", :controller => "deputies", :action => "new"
  post "/create_deputy", :controller => "deputies", :action => "create"

  # READ
  get "/deputies", :controller => "deputies", :action => "index"
  get "/deputies/:id", :controller => "deputies", :action => "show"
  get "/deputies/:id/expenses", :controller => "deputies", :action => "show_expenses"

  # UPDATE
  get "/deputies/:id/edit", :controller => "deputies", :action => "edit"
  post "/update_deputy/:id", :controller => "deputies", :action => "update"

  # DELETE
  get "/delete_deputy/:id", :controller => "deputies", :action => "destroy"
  #------------------------------

  devise_for :users

  get "/my_bookmarked_deputies", :controller => "users", :action => "show_bookmarked_deputies"
  get "/my_bookmarked_senators", :controller => "users", :action => "show_bookmarked_senators"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
