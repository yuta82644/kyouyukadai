class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    @picture = Picture.new(picture_params) if params[:back]
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        # ContactMailer.contact_mail(@picture).deliver
        redirect_to pictures_path, notice: "投稿が作成されました"
      else
        render :new
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.valid?
      render :confirm
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "削除しました"
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end
end
