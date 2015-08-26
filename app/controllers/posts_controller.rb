class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if current_user.nil? || current_user.admin != true
      redirect_to('/')
    end
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if !current_user.nil? || current_user.id != @post.user_id
      redirect_to('/')
    end
  end

  # GET /posts/new
  def new
    if current_user.nil?
      redirect_to('/')
    end
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if current_user.nil?
      redirect_to('/')
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    if current_user.nil?
      redirect_to('/')
    end
    @post = Post.new( post_params.merge( { user_id: current_user.id } ) )
      if @post.save
        redirect_to('/')
      else
        flash[:alert] = "Come on' " << current_user.user_name << ", don't be a loser. write a real post. The following was wrong:"
        render :new
      end
    end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if current_user.nil? || current_user.id != @post.user_id
        redirect_to('/')
      end
      unless current_user.admin == true
      end
      if @post.update(post_params)
        redirect_to('/')
      else
        flash[:alert] = "Come on' " << current_user.user_name << ", don't be a loser. write a real post. The following was wrong:"
        render :edit
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if current_user.nil? || current_user.id != @post.user_id
      redirect_to('/')
    end
    @post.destroy
    redirect_to('/')
  end

  def subpost
    @post = Post.new
    @parent_post = Post.find(params[:id])
  end

  def make_subpost
    @post = Post.new( post_params.merge( { user_id: current_user.id } ) )
    if @post.save
      redirect_to('/')
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :body, :status, :parent_id)
    end
end
