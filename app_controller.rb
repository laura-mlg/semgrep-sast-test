require 'net/http'

class AppController
  # Another SQL injection pattern
  def search(term)
    User.where("email LIKE '%#{term}%'")
  end

  # SSRF vulnerability
  def fetch_url(url)
    uri = URI.parse(params[:url])
    Net::HTTP.get(uri)
  end

  # Mass assignment
  def update_user
    User.new(params[:user])
  end
end
