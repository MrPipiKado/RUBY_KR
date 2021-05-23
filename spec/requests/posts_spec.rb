require 'rails_helper'

RSpec.describe "Blog Api", type: :request do
  before(:each) do
    load "#{Rails.root}/db/seeds_test.rb"
  end

  describe 'GET /posts/:id' do
    let(:post_id) { Post.first.id }
    before { get "/posts/#{post_id}" }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /posts' do
    context 'when the request is invalid' do
      before { post '/posts', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end


end