require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'Index method' do
    it 'Renders the index view' do
      get '/'
      expect(response).to render_template(:index)
    end
    it 'Its status response is correct' do
      get '/'
      expect(response).to have_http_status(status)
    end
    it 'Its response body includes correct placeholder text' do
      get '/'
      expect(response.body).to include('Here is a list of users')
    end
  end
  describe 'Show method' do
    it 'Renders the show view' do
      get '/users/1'
      expect(response).to render_template(:show)
    end
    it 'Its status response is correct' do
      get '/users/1'
      expect(response).to have_http_status(status)
    end
    it 'Its response body includes correct placeholder text' do
      get '/users/1'
      expect(response.body).to include('Here is the info of a given user')
    end
  end
end
