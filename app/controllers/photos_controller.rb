class PhotosController < ApplicationController

# Figure out a way to make sure users can't submit forms with blank data


  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @users = User.all
  end

  def create
    @photo = Photo.new
    @photo.source = params[:source]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos/#{ @photo.id }"
    else
      render 'new'
    end
end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to "/photos"
  end

  def edit
    @photo = Photo.find(params[:id])
    @users = User.all
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.source = params[:source]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.save

    redirect_to "/photos/#{ @photo.id }"
  end

  def index
    @photos = Photo.all
    @comment = Comment.new
    @users = User.all
  end
end
