class CatsController < ApplicationController
  def index
    @cats = Cat.all

    render :index
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      render :show
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cats_url
      #redirect_to index
      #render :index
    else
      render(
         :json => @cat.errors.full_messages,
         :status => :unprocessable_entity
       )
    end
  end

  def edit
    @cat = Cat.find(params[:id])

  end

  def show
    @cat = Cat.find(params[:id])

  end

  def destroy

  end

  def new
    @cat = Cat.new
  end

  private

def cat_params
  params.require(:cat).permit(:name, :sex, :birth_day, :description, :color)
end

end
