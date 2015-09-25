class BdayMessage < ActiveRecord::Base
  validates :body, presence: { message: "can't be blank 메세지 내용을 작성해주세요" }, length: { minimum: 5 }
  validates :password, presence: { message: "is missing 4자리 비밀번호를 입력해주세요" }, length: { is: 4 }
end
