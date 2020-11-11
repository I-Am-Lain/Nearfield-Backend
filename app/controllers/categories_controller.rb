class CategoriesController < ApplicationController


    def index
        categories = Category.all
        render json: categories
    end

    def show
        category = Category.find_by(id: params[:id])
        render json: category
    end

    def new
        category = Category.new
        render json: category
    end

    def create
        category = Category.create(category_params)
        render json: category
    end

    def update
        category = Category.find_by(id: params[:id])
        category.update(category_params)
        render json: category
    end

    def delete
        category = Category.find_by(id: params[:id])
        category.delete
    end

end
