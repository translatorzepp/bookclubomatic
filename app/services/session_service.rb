module SessionService

  def set_voter_name(params)
    session[:current_voter_name] = params[:voter_name] if params[:voter_name]
  end

end
