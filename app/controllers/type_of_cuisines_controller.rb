class TypeOfCuisinesController < ApplicationController
  def index
    @type_of_cuisines = TypeOfCuisine.all

    render("type_of_cuisines/index.html.erb")
  end

  def show
    @dish = Dish.new
    @type_of_cuisine = TypeOfCuisine.find(params[:id])

    render("type_of_cuisines/show.html.erb")
  end

  def new
    @type_of_cuisine = TypeOfCuisine.new

    render("type_of_cuisines/new.html.erb")
  end

  def create
    @type_of_cuisine = TypeOfCuisine.new

    @type_of_cuisine.name = params[:name]

    save_status = @type_of_cuisine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/type_of_cuisines/new", "/create_type_of_cuisine"
        redirect_to("/type_of_cuisines")
      else
        redirect_back(:fallback_location => "/", :notice => "Type of cuisine created successfully.")
      end
    else
      render("type_of_cuisines/new.html.erb")
    end
  end

  def edit
    @type_of_cuisine = TypeOfCuisine.find(params[:id])

    render("type_of_cuisines/edit.html.erb")
  end

  def update
    @type_of_cuisine = TypeOfCuisine.find(params[:id])

    @type_of_cuisine.name = params[:name]

    save_status = @type_of_cuisine.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/type_of_cuisines/#{@type_of_cuisine.id}/edit", "/update_type_of_cuisine"
        redirect_to("/type_of_cuisines/#{@type_of_cuisine.id}", :notice => "Type of cuisine updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Type of cuisine updated successfully.")
      end
    else
      render("type_of_cuisines/edit.html.erb")
    end
  end

  def destroy
    @type_of_cuisine = TypeOfCuisine.find(params[:id])

    @type_of_cuisine.destroy

    if URI(request.referer).path == "/type_of_cuisines/#{@type_of_cuisine.id}"
      redirect_to("/", :notice => "Type of cuisine deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Type of cuisine deleted.")
    end
  end
end
