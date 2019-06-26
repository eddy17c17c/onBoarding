class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :name]
  before_action :set_shop, only: [:show]

  def name
    # add name to before_action to get use of set_user
    name = "#{@user.first_name}  #{@user.last_name}"

    # you can make a jbuilder if you want, but i am lazy
    render json: name, status: :ok
  end

  def count
    @users_count = User.all.count
    render 'users/count.json'
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save
    @user.create_shop(user_params['shop'])

    respond_to do |format|
      if @user.present?
        format.html { redirect_to action: "index", notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
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
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_shop
      @shop = Shop.find_by(user: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    # This is called strong params
    def user_params
      params.require(:user).permit(:first_name, :last_name, :age, :gender, :shop)
    end
end
