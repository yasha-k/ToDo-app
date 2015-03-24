

module ToDoApp
  module Controllers
    module Sessions
      include ToDoApp::Controller

      

      action "Create" do
        include Lotus::Action::Session # ajoute le 27.01.2015, include touojours suivi d'un espace sans les 2 points
        

        def call(params)
          user=ToDoApp::Repositories::UserRepository.find_by_email_and_password( params[:email], params[:password])
          if user.nil?
            #usernotfound
            redirect_to '/users/signin'
          else          
           session[:user] = user.id# ajoute le 27.01.2015
           redirect_to "/"#pour renvoyer directement vers le home`page quand il y un signin LE USER DOIT ETRE REGISER
                         # AU PREABLE SINON CA NE VA PAS FONCTIONNER 

          end
        end
      end

      

      
      #CRUD
      #Create Read Update Delete
      #Seperation of Concerns



      
    end
  end
end
