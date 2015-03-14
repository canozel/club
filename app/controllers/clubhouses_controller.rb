class ClubhousesController < ApplicationController
  before_filter :set_clubhouse, only: [:show, :edit, :update, :destroy]
  def index
  	@clubs = Clubhouse.all
  end

  def show
  end

  def new
  	@club = Clubhouse.new
  end

  def create
    @club = Clubhouse.new(clubhouse_params)
    if @club.save
      redirect_to @club, notice: 'İlan başarıyla oluşturuldu!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @club.update(clubhouse_params)
      redirect_to @club, notice: "başarılı"
    else
      render :edit
    end
  end

  def destroy
    @club.delete
    redirect_to root_path, notice: 'İlan başarıyla silindi!'
  end

  private
  def set_clubhouse
    @club = Clubhouse.find(params[:id])
  end

  def clubhouse_params
    params.require(:clubhouse).permit(:name, :club_president, :veep, :accountant, :clerk, :first_permanent_member, :second_permanent_member, :third_permanent_member)
  end
end
