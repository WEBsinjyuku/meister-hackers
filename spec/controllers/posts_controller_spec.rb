# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post1) { create(:post) }
  let(:post_params) { { title: "hello", content: "content", repository: "repo_name" } }

  describe "new" do
    context "200" do
      before do
        session[:user_id] = user.id
        get :new
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context "302" do
      before { get :new }

      it do
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "create" do
    context "not save" do
      it "not login" do
        expect {
          post :create, params: { post: post_params }
        }.not_to change { Post.count }
      end
    end

    context "save" do
      before do
        session[:user_id] = user.id
      end

      it do
        expect {
          post :create, params: { post: post_params }
        }.to change { Post.count }.by(1)
      end

      # TODO: 詳細ページ出来次第，コメントイン
      # it "redirect to show page" do
      #   post params: { post: post_params }
      #   post = Post.last
      #   expect(response).to redirect_to(post)
      # end
    end
  end

  describe "edit" do
    context "200" do
      before do
        session[:user_id] = post1.user.id
        get :edit, params: { id: post1.id }
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context "302" do
      it "not login" do
        get :edit, params: { id: post1.id }
        expect(response).to have_http_status(302)
      end

      it "not author" do
        session[:user_id] = user.id
        get :edit, params: { id: post1.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "update" do
    context "not save" do
      it "not login" do
        expect {
          put :update, params: { id: post1.id, post: post_params }
        }.not_to change { post1 }
      end

      it "not author" do
        session[:user_id] = user.id
        expect {
          put :update, params: { id: post1.id, post: post_params }
        }.not_to change { post1 }
      end
    end

    context "save" do
      before do
        session[:user_id] = post1.user.id
        put :update, params: { id: post1.id, post: post_params }
        post1.reload
      end

      it do
        expect(post1.title).to eq(post_params[:title])
      end

      # TODO: 詳細ページ出来次第，コメントイン
      # it do
      #   expect(response).to redirect_to(post1)
      # end
    end
  end
end
