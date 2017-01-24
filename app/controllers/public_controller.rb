class PublicController < ApplicationController
  
  def login
    if session[:username]
      redirect_to(:action=>'index')
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email=>params[:email]).first

      if found_user
        authorized_user = found_user.authenticate(params[:password])
        
        if authorized_user
          session[:username] = authorized_user.username
          session[:user_id] = authorized_user.id
          redirect_to(:action=>'index')
        else
          redirect_to(:action=>'index')
        end
      
      else
        render('login')
      end
    else
#      flash[:notice] = 'Invalid password/username'
      render('login')
    end

  end

  def logout
    if session[:username]
      session[:username] = nil
      session[:user_id] = nil
      session[:unread_requests] = 0
      session[:unread_messages] = 0
      redirect_to(:action=>'login')

    end
  end

  def index
    check_search(params[:search])

    # set default user logged in at id = 1, John Doe
    # id 2 is richard
    # demo_user = 1
    # session[:username] = User.find(demo_user).username
    # session[:user_id] = demo_user
    @user = User.find(session[:user_id])
    @forums = Forum.order(:created_at => :desc)
    @jsondata = params[:data]
    unread_requests = Request.where(:to_id=>session[:user_id]).where(:read=>false)
    session[:unread_requests] = unread_requests.size

    unread_messages = Message.where(:to_id=>session[:user_id]).where(:read=>false)
    session[:unread_messages] = unread_messages.size
  end

  def profile
    check_search(params[:search])

    @user = User.find(params[:id])
  end

  def messages_inbox

    check_search(params[:search])

    @user = User.find(session[:user_id])
    @messages = @user.messages.order(:created_at => :desc)
    @received_msgs = Message.where(to_id: session[:user_id]).order(:created_at => :desc)
    
    @received_msgs.each do |msg|
      msg.update_attributes(:read=>true)
    end
    unread_messages = Message.where(:to_id=>session[:user_id]).where(:read=>false)
    session[:unread_messages] = unread_messages.size
  end

  def search
    if !params[:search].blank?
      @search_results = Forum.search(params[:search])
    else 
      @search_results = Forum.search('all')
    end
  end

  def requests_inbox

    check_search(params[:search])

    @user = User.find(session[:user_id])
    @requests = @user.requests.order(:created_at => :desc)
    @received_reqs = Request.where(to_id: session[:user_id]).order(:created_at => :desc)
    @received_reqs.each do |req|
      req.update_attributes(:read=>true)
    end
    unread_requests = Request.where(:to_id=>session[:user_id]).where(:read=>false)
    session[:unread_requests] = unread_requests.size
  end

  def send_request
  end

  def reject  

    redirect_to(:controller=>'messages',:action=>'new', :body=>'Your request has unfortunately be rejected. If you wish to know why, please send a message to the seller.', :to_id=>params[:to_id])
  end

  def confirm
    redirect_to(:controller=>'messages',:action=>'new', :body=>'Congratulations! Your request was approved!', :to_id=>params[:to_id])
    
  end
end
