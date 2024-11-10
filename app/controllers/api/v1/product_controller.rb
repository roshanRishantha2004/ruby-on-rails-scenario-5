class Api::V1::ProductController < ApplicationController
  def index
    product = Product.all

    if product
      render json: { success: true, status: 200, message: "All Records found!", data: product }
    else
      render json: { success: false, status: 404, message: "Can not find records" }
    end

  end

  def show
    product = Product.find_by(id: params[:id])

    if product
      render json: { success: true, status: 200, message: "All Record found!", data: product }
    else
      render json: { success: false, status: 404, message: "Can not find record" }
    end
  end

  def create

    category = Category.find_by(id: params[:category_id])

    if category
      product = category.products.build(product_params)
      if product.save
        render json: { success: true, status: 201, message: "New record added!" }
      else
        render json: { success: false, status: 400, message: "Error creating new record!" }
      end
    else
      render json: { success: false, status: 404, message: "Can not find category!" }
    end

  end

  def update
    product = Product.find_by(id: params[:id])

    if product
      product.update(name: params[:name], price: params[:price], category_id: params[:category_id])
      render json: { success: true, status: 200, message: "Record updated!" }
    else 
      render json: { success: false, status: 404, message: "Can not update record!" }
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    
    if product
      product.destroy
      render json: { success: true, status: 200, message: "Record deleted!" }
    else
      render json: { success: false, status: 201, message: "Can not delete record!" }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end

end
