module Api
  class PostsController < ApplicationController
    include Pagination

    def index
      posts = Post.all.page(params[:page])
      pagination = resources_with_pagination(posts)
      data = USER_SERIALIZER.new(users).serializable_hash.merge(pagination)

      render json: { posts: posts }, status: :ok
    end

    def top
      posts = Post.order("created_at").first(8)

      render json: { posts: posts }, status: :ok
    end

    def show
      post = Post.includes(:comments).find(params[:id])
      render json: { post: post } , status: :ok
    end

    def create
      begin
        post = Post.new(
          title: params[:title],
          body: params[:body],
          from: params[:from],
          to: params[:to],
          user_id: params[:user_id],
          country_id: params[:country_id],
          city_id: params[:city_id],
          category_id: params[:category_id]
        )
        if post.save
          render json: { message: "post created" }, status: :ok
          return
        else
          render json: { message: "post create failed" }, status: 400
        end
      rescue e
        render json: { message: e }, status: :unprocessable_entity
      end
    end

    def update
    end

    def delete
      begin
        Post.find(params[:id]).destroy
        render json: { message: "successfully deleted"}, status: :ok
      rescue
        render json: { message: "server error"}, status: :unprocessable_entity
      end
    end

    private
    def post_params
    end
  end
end