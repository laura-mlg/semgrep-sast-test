require 'yaml'

class AppController
  def execute(code)
    eval(code)
  end

  def load_config(data)
    YAML.load(data)
  end

  def dynamic_call
    send(params[:method])
  end

  def redirect
    redirect_to params[:url]
  end
end
