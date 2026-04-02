class UnsafeQuery
  # Unsafe eval
  def execute(code)
    eval(code)
  end

  # Open redirect via send
  def dynamic_call(method_name)
    send(params[:method])
  end

  # Cookie without secure flag
  def set_cookie(response)
    response.set_cookie("session", value: "abc123", httponly: false)
  end
end
