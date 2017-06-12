class DeputiesController < ApplicationController
  def index
    @deputies = Deputy.all

    render("deputies/index.html.erb")
  end

  def show
    @deputy = Deputy.find(params[:id])

    render("deputies/show.html.erb")
  end

  def show_expenses
    @deputy = Deputy.find(params[:id])
    url = "http://meucongressonacional.com/api/001/deputado/#{@deputy.id}/gastos/cnpj"
    @deputy_expenses_parsed_data = JSON.parse(open(url).read)


    render("deputies/show_expenses.html.erb")
  end

  def new
    @deputy = Deputy.new

    render("deputies/new.html.erb")
  end

  def create
    @deputy = Deputy.new

    @deputy.name = params[:name]
    @deputy.party = params[:party]
    @deputy.sex = params[:sex]
    @deputy.state = params[:state]
    @deputy.telephone = params[:telephone]
    @deputy.email = params[:email]
    @deputy.picture = params[:picture]
    @deputy.expenses = params[:expenses]

    save_status = @deputy.save

    if save_status == true
      redirect_to("/deputies/#{@deputy.id}", :notice => "Deputy created successfully.")
    else
      render("deputies/new.html.erb")
    end
  end

  def edit
    @deputy = Deputy.find(params[:id])

    render("deputies/edit.html.erb")
  end

  def update
    @deputy = Deputy.find(params[:id])

    @deputy.name = params[:name]
    @deputy.party = params[:party]
    @deputy.sex = params[:sex]
    @deputy.state = params[:state]
    @deputy.telephone = params[:telephone]
    @deputy.email = params[:email]
    @deputy.picture = params[:picture]
    @deputy.expenses = params[:expenses]

    save_status = @deputy.save

    if save_status == true
      redirect_to("/deputies/#{@deputy.id}", :notice => "Deputy updated successfully.")
    else
      render("deputies/edit.html.erb")
    end
  end

  def destroy
    @deputy = Deputy.find(params[:id])

    @deputy.destroy

    if URI(request.referer).path == "/deputies/#{@deputy.id}"
      redirect_to("/", :notice => "Deputy deleted.")
    else
      redirect_to(:back, :notice => "Deputy deleted.")
    end
  end
end
