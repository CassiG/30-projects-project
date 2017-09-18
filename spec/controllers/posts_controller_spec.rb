require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    before :each do
      @post = FactoryGirl.create(:post)
      get :index
    end

    it "shows the :index view" do
      expect(response).to render_template(:index)
    end

    it "shows a list of posts" do
      expect(assigns(:posts)).to eq([@post])
    end
  end

  describe 'GET #show' do
    before :each do
      @post = FactoryGirl.create(:post)
      get :show, params: {id: @post.id}
    end

    it "shows the correct post" do
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the #show view" do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    before :each do
      @post = FactoryGirl.create(:post)
      get :new
    end

    it "shows the correct post" do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the #show view" do
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @post = FactoryGirl.create(:post)
    end

    it "deletes the post" do
      expect{delete :destroy, params: {id: @post.id}}.to change(Post,:count).by(-1)
    end

    it "redirects to contacts#index" do
      delete :destroy,  params: {id: @post.id}
      expect(response).to redirect_to posts_path
    end
  end
end
