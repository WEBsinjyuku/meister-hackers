# frozen_string_literal: true

module TestDatas
  extend Rake::DSL
  extend self

  namespace :test_datas do
    desc "テストデータ生成"
    task all: :environment do
      [
        "rails test_datas:reset_all",
        "rails test_datas:create_users",
        "rails test_datas:create_posts",
        "rails test_datas:create_messages"
      ].each do |task|
        sh task
      end
    end

    task reset_all: :environment do |_task, _args|
      return if disable_env?
      reset_all
    end

    desc "テストユーザ生成"
    task create_users: :environment do |_task, _args|
      return if disable_env?
      5.times do |t|
        create_user
      end
    end

    desc "テストデータ生成(post)"
    task create_posts: :environment do | _task, _args|
      return if disable_env?

      User.all do |user|
        create_post(user)
      end
    end

    desc "テストデータ生成(message)"
    task create_messages: :environment do | _task, _args|
      return if disable_env?

      Post.all do |post|
        5.times do
          create_message(post: post)
        end
      end
    end

    def create_user
      user = FactoryBot.create(:user)
      FactoryBot.create(:profile, user: user)
    end

    def create_post(user)
      FactoryBot.create(:post, user: user)
    end

    def create_message(post)
      FactoryBot.create(:message, post: post)
    end

    def reset_all
      return if disable_env?

      User.delete_all
      Post.delete_all
    end

    def disable_env?
      allow_env = %i(development test)
      !allow_env.include?(Rails.env.to_sym)
    end
  end
end
