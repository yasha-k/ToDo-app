module ToDoApp
  module Controllers
    module Users
      include ToDoApp::Controller

      action "New" do
        def call(params)
        end
      end

      action "Create" do

        def call(params)

          user = ToDoApp::Models::User.new({email: params[:email], password: params[:password]})
          
          ToDoApp::Repositories::UserRepository.create(user)
          

          redirect_to "/"
        end
      end

      action "Signin" do
        def call(params)
        end

      end
      #CRUD
      #Create Read Update Delete
      #Seperation of Concerns



      
    end
  end
end
