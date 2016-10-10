class CatsController < ApplicationController

  before_filter :ensure_login

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save!
      redirect_to cat_url(@cat)
    else
      flash[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cats_url
    else
      flash[:errors] = @cat.errors.full_messages
      render :edit
    end
  end


  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    redirect_to cats_url
  end


  private

def cat_params
  params.require(:cat).permit(:name, :sex, :birth_day, :description, :color)
end

end
