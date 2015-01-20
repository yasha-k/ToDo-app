module ToDoApp
  module Controllers
    module Sessions
      include ToDoApp::Controller

      

      action "Create" do

        def call(params)

          

          redirect_to "/"
        end
      end

      

      
      #CRUD
      #Create Read Update Delete
      #Seperation of Concerns



      
    end
  end
end
