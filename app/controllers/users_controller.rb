class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if current_user.nil? || current_user.admin != true
      redirect_to('/')
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !session[:user_id].nil?
      flash.notice = current_user.user_name + " is logged in."
    end
    if current_user.nil?
      redirect_to('/')
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @disable_nav = true

    if !current_user.nil?
      redirect_to('/')
    end
  end

  # GET /users/1/edit
  def edit
    unless edit_user_path == edit_user_path(current_user) || current_user.admin == true
      redirect_to('/')
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        session[:user_id] = @user.id
      else
        # render 'users/new'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render('log-out')
    if current_user.nil? || edit_user_path != edit_user_path(current_user)
      redirect_to('/')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :user_name, :email, :avatar, :password, :password_confirmation, :bio, :admin)
    end
end
