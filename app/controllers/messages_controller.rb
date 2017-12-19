class MessagesController < ApplicationController
  before_action :authorize

  def index
    # 지금까지 보낸 메세지 보ㅕ주기
    @messages = Message.all.reverse
  end


  def send_msg
    token = Rails.application.secrets.telegram_token
    url = "https://api.telegram.org/bot"

    res = HTTParty.get("#{url}#{token}/getUpdates")
    hash = JSON.parse(res.body)
    chat_id = hash["result"][0]["message"]["chat"]["id"]

    text = URI.encode("#{current_user.email}: " + params[:msg]) # current_user.email를 application_controller.rb에 정의해놓음
    HTTParty.get("#{url}#{token}/sendMessage?chat_id=#{chat_id}&text=#{text}")
    # 보낸 메세지 저장하기

    Message.create(
      user_id: session[:user_id],
      content: params[:msg] #msg를 콘텐트에 넣음
    )
    redirect_to '/'
  end

end
