class ApplicationController < ActionController::Base # < 는 상속표시
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
    # 이프문을 뒤에 붙여주면 이프 엔드문으로 감싼것과 같음
  end

  # 모든 컨트롤러가 발동되기 이전에
  # 유저가 접속되어 있는지 확인한다


  def authorize # 유저가 승인되었는지 (로그인 되었는지)
     # 현재 유저가 접속되있지 않으면
     unless current_user
      redirect_to '/users/login' unless current_user
    end
  end


  # helper_method :current_user # current_user를 헬퍼에 심어주는 역할임

  # current_user
  # @user.email

  #current_user().email # 위에 구문과 같음
end
