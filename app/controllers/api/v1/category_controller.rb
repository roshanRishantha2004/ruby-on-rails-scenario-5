class Api::V1::CategoryController < ApplicationController
  def index
    category = Category.all

    if category
      render json: { success: true, status: 200, message: "All Records found!", data: category }
    else
      render json: { success: false, status: 404, message: "Can not find records" }
    end

  end

  def show
    category = Category.find_by(id: params[:id])

    if category
      render json: { success: true, status: 200, message: "All Record found!", data: category }
    else
      render json: { success: false, status: 404, message: "Can not find record" }
    end

  end

  def create
    category = Category.new(category_params)
    
    if category.save
      render json: { success: true, status: 201, message: "New record added!" }
    else
      render json: { success: false, status: 400, message: "Error creating new record!" }
    end

  end

  def update
    category = Category.find_by(id: params[:id])

    if category
      category.update(title: params[:title], slug: params[:slug])
      render json: { success: true, status: 200, message: "Record updated!" }
    else 
      render json: { success: false, status: 404, message: "Can not update record!" }
    end

  end

  def destroy
    category = Category.find_by(id: params[:id])
    
    if category
      category.destroy
      render json: { success: true, status: 200, message: "Record deleted!" }
    else
      render json: { success: false, status: 201, message: "Can not delete record!" }
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :slug)
  end

end
