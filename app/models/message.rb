class Message < ActiveRecord::Base
  belongs_to :user #이거 없으면 rails c 해서 user.messages 뽑는거 불가능
  #이거 없으면 rails c 해서 user.messages 뽑는거를 도와주는 역할을 함
end
