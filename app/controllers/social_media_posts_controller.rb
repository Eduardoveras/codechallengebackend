class SocialMediaPostsController < ApplicationController
  before_action :set_social_media_post, only: [:show, :update, :destroy]

  # GET /social_media_posts
  def index
    if (params.has_key?(:topic_id))
      @social_media_posts = SocialMediaPost.where(topic_id: params[:topic_id])
    else
      @social_media_posts = SocialMediaPost.all
    end


    paginate json: @social_media_posts
  end

  # GET /social_media_posts/1
  def show
    render json: @social_media_post
  end

  # POST /social_media_posts
  def create
    @social_media_post = SocialMediaPost.new(social_media_post_params)

    if @social_media_post.save
      render json: @social_media_post, status: :created, location: @social_media_post
    else
      render json: @social_media_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /social_media_posts/1
  def update
    if @social_media_post.update(social_media_post_params)
      render json: @social_media_post
    else
      render json: @social_media_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /social_media_posts/1
  def destroy
    @social_media_post.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_social_media_post
    @social_media_post = SocialMediaPost.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def social_media_post_params
    params.require(:social_media_post).permit(:text_content, :topic_id, :social_medium_id)
  end
end
