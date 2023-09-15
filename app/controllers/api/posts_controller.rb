module Api
  class PostsController < ApplicationController
    include Pagination

    def index
      posts = Post.all.page(params[:page])
      pagination = resources_with_pagination(posts)
      data = USER_SERIALIZER.new(users).serializable_hash.merge(pagination)

      render json: data, status: :ok
    end

    def show
      post = Post.find(params[:id])
      render json: { post }, status: :ok
    end

    def create
      post = Post.new(
        title: params[:title]
        body: params[:body]
        from: params[:from]
        to: params[:to]
        user_id: params[:user_id]
      )
      if post.save
        LinkCountry.batch_insert(params[:country_ids], post.id)
        LinkCity.batch_insert(params[:city_ids], post.id)
        LinkRegion.batch_insert(params[:region_ids], post.id)
        LinkCategory.batch_insert(params[:category_ids], post.id)
      else
        render json: { message: "post create failed" }, status: :400
      end
    end

    def update
    end

    def delete
    end

    private
    def post_params
    end
  end
end