require 'lotus/action/session'

module ToDoApp
  module Controllers
    module Home
      include ToDoApp::Controller# ToDoApp le nom du module, toujours faire atention

      action 'Index' do
         include Lotus::Action::Session # ajoute le 27.01.2015
        expose :tasks
        expose :user

        def call(params)
          puts "SESSION: #{session[:user]}"
          if params[:newest]
            @tasks = ToDoApp::Repositories::TaskRepository.latest_tasks
          elsif params[:alphabetically]
            @tasks = ToDoApp::Repositories::TaskRepository.alphabetically
          else
            @tasks = ToDoApp::Repositories::TaskRepository.all
          end
          @user = ToDoApp::Repositories::UserRepository.by_id(session[:user])
        end
      end

      action "Create" do

        def call(params)

          new_task = ToDoApp::Models::Task.new({name: params[:task],user_id: session[:user]})
          if !new_task.name.nil? && !new_task.name.strip.empty?
            ToDoApp::Repositories::TaskRepository.create(new_task)
          end

          redirect_to "/"
        end

      end
      #CRUD
      #Create Read Update Delete
      #Seperation of Concerns


      action 'Delete' do

        def call(params)
          task = ToDoApp::Repositories::TaskRepository.find(params[:task_id])
          ToDoApp::Repositories::TaskRepository.delete(task)

          redirect_to '/' #lotusmethode
        end
      end  


      
    end
  end
end
