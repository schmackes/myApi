class MailersController < ApplicationController

  def new
    #currently default is only HTTP GET => redirect to create
    create
  end

  def create
    @mail=Hash[:to=>params[:to],:subject=>params[:subject],:body=>params[:body]]
    email = MyMailer.send_mail(@mail).deliver

    render :json=>@mail

    #
    #er = User.new(params[:user])
    #
    #pond_to do |format|
    #f @user.save
    # # Tell the UserMailer to send a welcome Email after save
    # UserMailer.welcome_email(@user).deliver
    #
    # format.html { redirect_to(@user, :notice => 'User was successfully created.') }
    # format.json { render :json => @user, :status => :created, :location => @user }
    #lse
    # format.html { render :action => "new" }
    # format.json { render :json => @user.errors, :status => :unprocessable_entity }
    #nd
    #
  end
end
