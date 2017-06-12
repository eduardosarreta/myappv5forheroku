class StatesController < ApplicationController
  def index
    @states = State.all

    render("states/index.html.erb")
  end

  def show
    @state = State.find(params[:id])

    render("states/show.html.erb")
  end

  def show_deputies
    @state = State.find(params[:id])
    @deputies = Deputy.all
    url = "http://meucongressonacional.com/api/001/deputado/estado/"+ @state.name
    parsed_data = JSON.parse(open(url).read)
    id_deputies = []

    parsed_data.each do |x|
      id = x["id"]
      id_deputies.push(id)
    end

    @id_output_d = id_deputies

    render("states/show_deputies.html.erb")
  end

  def show_senators
    @state = State.find(params[:id])
    @senators = Senator.all
    url = "http://meucongressonacional.com/api/001/senador/estado/"+ @state.name
    parsed_data = JSON.parse(open(url).read)
    id_senators = []

    parsed_data.each do |x|
      id = x["id"]
      id_senators.push(id)
    end

    @id_output_s = id_senators

    render("states/show_senators.html.erb")
  end

  def new
    @state = State.new

    render("states/new.html.erb")
  end

  def create
    @state = State.new

    @state.name = params[:name]

    save_status = @state.save

    if save_status == true
      redirect_to("/states/#{@state.id}", :notice => "State created successfully.")
    else
      render("states/new.html.erb")
    end
  end

  def edit
    @state = State.find(params[:id])

    render("states/edit.html.erb")
  end

  def update
    @state = State.find(params[:id])

    @state.name = params[:name]

    save_status = @state.save

    if save_status == true
      redirect_to("/states/#{@state.id}", :notice => "State updated successfully.")
    else
      render("states/edit.html.erb")
    end
  end

  def destroy
    @state = State.find(params[:id])

    @state.destroy

    if URI(request.referer).path == "/states/#{@state.id}"
      redirect_to("/", :notice => "State deleted.")
    else
      redirect_to(:back, :notice => "State deleted.")
    end
  end
end
