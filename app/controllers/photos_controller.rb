class PhotosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def new
    @user = current_user
    @photo = current_user.photos.build if logged_in?
  end

  def create
    uploaded_photo = params[:photo][:photo]
    File.open(Rails.root.join('app', 'assets', 'images', uploaded_photo.original_filename),
    'wb') do |file|
      file.write(uploaded_photo.read)
    end
    @photo = current_user.photos.build(file_name: uploaded_photo.original_filename )
    if @photo.save
      flash[:success] = "Photo uploaded!"
    end
    redirect_to current_user

  end

  def destroy
    @photo.destroy
    flash[:success] = "Photo deleted"
    redirect_to current_user
  end

  private

   def correct_user
     @photo = current_user.photos.find_by(id: params[:id])
   end

end
