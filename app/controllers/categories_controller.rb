class CategoriesController < ApplicationController


    def index
        categories = Category.all
        render json: CategorySerializer.new(categories).to_serialized_json
    end

    def show
        category = Category.find_by(id: params[:id])
        render json: CategorySerializer.new(category).to_serialized_json
    end

    def new
        category = Category.new
        render json: CategorySerializer.new(category).to_serialized_json
    end

    def create
        category = Category.create(category_params)
        render json: CategorySerializer.new(category).to_serialized_json
    end

    def update
        category = Category.find_by(id: params[:id])
        category.update(category_params)
        render json: CategorySerializer.new(category).to_serialized_json
    end

    def delete
        category = Category.find_by(id: params[:id])
        category.delete
    end

end
