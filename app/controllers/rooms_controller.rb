class RoomsController < ApplicationController

before_action :current_user_check, only: [:show, :edit, :update, :destroy]

  def current_user_check
    @room = Room.find(params[:id])
    if @room.user_id != current_user.id
        redirect_to :back
    end
  end


  def index
    @rooms = Room.where(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new
    @room.user_id = current_user.id
    @room.name = params[:name]

    if @room.save
      redirect_to "/rooms", :notice => "Room created successfully."
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    @room.user_id = current_user.id
    @room.name = params[:name]

    if @room.save
      redirect_to "/rooms", :notice => "Room updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])

    @room.destroy

    redirect_to "/rooms", :notice => "Room deleted."
  end
end
