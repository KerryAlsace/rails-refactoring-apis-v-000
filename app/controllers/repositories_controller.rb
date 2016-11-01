class RepositoriesController < ApplicationController
  def index
  	@username = session[:username]
  	github = GithubService.new
    @repos_array = github.get_repos(session[:token])
  end

  def create
  	github = GithubService.new
		github.create_repo(session[:token], params[:name])

    redirect_to '/'
  end
end
