class ItemsController < ApplicationController

before_action :current_user_check, only: [:show, :edit, :update, :destroy]

  def current_user_check
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
        redirect_to :back
    end
  end

  def index
    @items = Item.where(user_id: current_user.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @room = Room.new
  end

  def create
    @item = Item.new
    @item.name = params[:name]
    @item.purchased = Chronic.parse(params[:purchased])
    @item.expiration = Chronic.parse(params[:expiration])
    @item.location = params[:location]
    @item.room_id = params[:room_id]
    @item.photo = params[:photo]
    @item.user_id = current_user.id
    @item.link = params[:link]

    if @item.save
      redirect_to :back, :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    @item.name = params[:name]
    @item.purchased = params[:purchased]
    @item.expiration = params[:expiration]
    @item.location = params[:location]
    @item.room_id = params[:room_id]
    @item.photo = params[:photo]
    @item.user_id = current_user.id
    @item.link = params[:link]

    if @item.save
      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    redirect_to "/items", :notice => "Item deleted."
  end

  def buy
    @items = current_user.items.where("expiration < ?", Date.today)
  end

end
