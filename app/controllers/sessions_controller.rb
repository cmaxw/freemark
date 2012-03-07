class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    @user = User.get(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:username] = params[:username]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # DELETE /sessions
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :ok }
    end
  end
end
