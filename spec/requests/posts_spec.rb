require 'rails_helper'

RSpec.describe "Posts controller", type: :request do
  describe 'Index method' do
    it 'Renders the index view' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end
    it 'Its status response is correct' do
      get '/users/1/posts'
      expect(response).to have_http_status(status)
    end
    it 'Its response body includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'Show method' do
    it 'Renders the show view' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
    it 'Its status response is correct' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(status)
    end
    it 'Its response body includes correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is a post of a given user')
    end
  end
end
