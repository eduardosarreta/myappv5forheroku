class SenatorsController < ApplicationController
  def index
    @senators = Senator.all

    render("senators/index.html.erb")
  end

  def show
    @senator = Senator.find(params[:id])

    render("senators/show.html.erb")
  end

  def show_expenses
    @senator = Senator.find(params[:id])
    url = "http://meucongressonacional.com/api/001/senador/#{@senator.id}/gastos/cnpj"
    @senator_expenses_parsed_data = JSON.parse(open(url).read)


    render("senators/show_expenses.html.erb")
  end



  def new
    @senator = Senator.new

    render("senators/new.html.erb")
  end

  def create
    @senator = Senator.new

    @senator.name = params[:name]
    @senator.party = params[:party]
    @senator.sex = params[:sex]
    @senator.state = params[:state]
    @senator.telephone = params[:telephone]
    @senator.email = params[:email]
    @senator.picture = params[:picture]
    @senator.expenses = params[:expenses]

    save_status = @senator.save

    if save_status == true
      redirect_to("/senators/#{@senator.id}", :notice => "Senator created successfully.")
    else
      render("senators/new.html.erb")
    end
  end

  def edit
    @senator = Senator.find(params[:id])

    render("senators/edit.html.erb")
  end

  def update
    @senator = Senator.find(params[:id])

    @senator.name = params[:name]
    @senator.party = params[:party]
    @senator.sex = params[:sex]
    @senator.state = params[:state]
    @senator.telephone = params[:telephone]
    @senator.email = params[:email]
    @senator.picture = params[:picture]
    @senator.expenses = params[:expenses]

    save_status = @senator.save

    if save_status == true
      redirect_to("/senators/#{@senator.id}", :notice => "Senator updated successfully.")
    else
      render("senators/edit.html.erb")
    end
  end

  def destroy
    @senator = Senator.find(params[:id])

    @senator.destroy

    if URI(request.referer).path == "/senators/#{@senator.id}"
      redirect_to("/", :notice => "Senator deleted.")
    else
      redirect_to(:back, :notice => "Senator deleted.")
    end
  end
end
