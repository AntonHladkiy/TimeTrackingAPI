require 'rails_helper'

RSpec.describe 'GET /api/v1/categories', type: :request do

  let(:url) { '/api/v1/categories' }
  let(:params) do
    {
      email: "test@gmail.com",
      password: "password"
    }
  end
  context 'when params are correct' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        @user=Fabricate(:user)
        @token=JsonWebToken.encode(sub: @user.id)
      end
      get url, headers: {Authorization:@token}
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end
  context 'when token is wrong' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        @user=Fabricate(:user)
      end
      get url, headers: {Authorization:"random"}
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end
  end
end
