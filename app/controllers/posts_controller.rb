class PostsController < ApplicationController
  before_action :authorize_request, except: [:index]
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorize_owner!, only: [:update, :destroy]

  # GET /posts
  def index
    posts = Post.all
    render json: posts
  end

  # GET /posts/:id
  def show
    render json: @post
  end

  # POST /posts
  def create
    post = @current_user.posts.build(post_params)
    if post.save
      DeletePostJob.set(wait_until: post.created_at + 24.hours).perform_later(post.id)
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_owner!
    return if @post.author_id == @current_user.id

    render json: { error: 'Forbidden: Not your post' }, status: :forbidden
  end

  def post_params
    params.require(:post).permit(:title, :body, tags: [])
  end
end
