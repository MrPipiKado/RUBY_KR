require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'routes' do
    it "routes to #index via GET" do
      expect(get: "/posts").to route_to("posts#index")
    end

    it "routes to #index via GET with search param" do
      expect(get: "/posts?search=New").to route_to("posts#index", search: "New")
    end

    it "routes to #update via GET" do
      expect(get: "/posts/1/edit").to route_to("posts#edit", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/posts/1").to route_to("posts#update", id: "1")
    end

    it "routes to #create via POST" do
      expect(post: "/posts").to route_to("posts#create")
    end

    it "routes to #show via GET" do
      expect(get: "/posts/1").to route_to("posts#show", id: "1")
    end

    it "routes to #delete via DELETE" do
      expect(delete: "/posts/1").to route_to("posts#delete", id: "1")
    end
  end
end

