require 'models/task_manager'

class TaskManagerApp
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
  end

  get /'tasks/new' do
    erb :new
  end

  post '/tasks' do
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  def task_manager
    database = YAML::Store.new('db/task_manager')
    @task_manager ||= TaskManager.new(database)
  end

  # post '/tasks' do
  #   "<p>Params: #{params}</p> <p> Task params: #{params[:task]}</p>"
  # end

end
