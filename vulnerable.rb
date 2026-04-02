require 'open-uri'
require 'yaml'
require 'erb'

class UserController
  # SQL injection vulnerability
  def find_user(name)
    query = "SELECT * FROM users WHERE name = '#{name}'"
    ActiveRecord::Base.connection.execute(query)
  end

  # Command injection
  def run_report(filename)
    system("cat /reports/#{filename}")
  end

  # Unsafe deserialization
  def load_config(data)
    YAML.load(data)
  end

  # Open redirect
  def redirect_to_url(url)
    redirect_to params[:url]
  end

  # Hardcoded secret
  def authenticate
    api_key = "sk_live_abc123secretkey456"
    headers = { "Authorization" => "Bearer #{api_key}" }
  end

  # ERB template injection
  def render_template(user_input)
    template = ERB.new(user_input)
    template.result(binding)
  end
end
