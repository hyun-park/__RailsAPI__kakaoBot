class Chats2Controller < ApplicationController
    def keyboard_init
        @msg =
            {
              type: "buttons",
              buttons: ["선택 1", "선택 2", "선택 3"]
            }
        render json: @msg, status: :ok
    end
    
    def chat_control
        @response = params[:content]
        @user_key = params[:user_key]
        @user = User.find_or_create_by(password: @user_key)
        
        if @user.name == nil
            if ["선택 1", "선택 2", "선택 3"].include? @response
                @response = {
                  message: {
                      text: "첫 톡이네요! 당신의 이름이 무엇인가요?"
                  },
                  keyboard: {
                    type: "text"
                  }
                }
                render json: @response, status: :ok
            else
                @user.name = @response
                @user.save
                @response = {
                  message: {
                      text: "#{@user.name}님 환영합니다! 버튼을 눌러주세요!"
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["선택 1", "선택 2", "선택 3"]
                  }
                }
                render json: @response, status: :ok
            end
        else
            if @response == "선택 1"
                @response = {
                  message: {
                      text: "#{@user.name}님이 선택 1을 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["선택 1", "선택 2", "선택 3"]
                  }
                }
                render json: @response, status: :ok
            elsif @response == "선택 2"
                @response = {
                  message: {
                      text: "#{@user.name}님이 선택 2를 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["선택 1", "선택 2", "선택 3"]
                  }
                }
                render json: @response, status: :ok
            elsif @response == "선택 3"
                @response = {
                  message: {
                      text: "#{@user.name}님이 선택 3을 누르셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["선택 1", "선택 2", "선택 3"]
                  }
                }
                render json: @response, status: :ok
            else
                @response = {
                  message: {
                      text: "#{@user.name}님이 잘못된 명령어를 입력하셨습니다."
                  },
                  keyboard: {
                    type: "buttons",
                    buttons: ["선택 1", "선택 2", "선택 3"]
                  }
                }
                render json: @response, status: :ok
            end            
        end
    end
end
