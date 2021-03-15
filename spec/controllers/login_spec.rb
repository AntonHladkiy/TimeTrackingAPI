require 'rails_helper'

RSpec.describe 'POST /api/v1/auth', type: :request do
  let(:url) { '/api/v1/auth' }
  let(:params) do
    {
      email: "test@gmail.com",
      password: "password"
    }
  end
  let(:wrong_params) do
    {
      email: "test@gmail.com",
      password: "1password"
    }
  end

  context 'when params are correct' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        Fabricate(:user)
      end
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns JTW token ' do
      expect(response.body['token']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        Fabricate(:user)
      end
      post url, params: wrong_params
    end

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
