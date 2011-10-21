class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:sign_in, :sign_up]
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    # Facebook feed
    if @user.authentications.find_by_provider('facebook')
      authentication = @user.authentications.find_by_provider('facebook')
      token = authentication.token
      @result = token
      @graph = Koala::Facebook::API.new(token) # 1.2beta and beyond
      @fb_profile = @graph.get_object("me")
      @fb_friends = @graph.get_connections("me", "friends")
    end
    
    # Twitter feed
    if @user.authentications.find_by_provider('twitter')   
     authentication = @user.authentications.find_by_provider('twitter')
     client = Twitter::Client.new
     @followers = client.followers.users
     @friends = client.friends.users
     @feeds = client.home_timeline
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def wall
  @user = User.find(params[:id])

    # first, initialize a Graph API with your token
    if @user.authentications.find_by_provider('facebook')
      authentication = @user.authentications.find_by_provider('facebook')
      token = authentication.token
      @result = token
      @graph = Koala::Facebook::API.new(token) # 1.2beta and beyond
      @graph.put_object("me", "feed", :message => params[:message])
      flash[:notice] = params[:message] + " was posted on your wall."
      redirect_to @user
    end
  end
  
  def tweet
      @user = User.find(params[:id])

    if @user.authentications.find_by_provider('twitter')   
      authentication = @user.authentications.find_by_provider('twitter')
      client = Twitter::Client.new
      client.update(params[:message])
      flash[:notice] = "You just tweeted: " + params[:message]
      redirect_to @user
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
