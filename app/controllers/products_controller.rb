class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: :hide

  # GET /products
  # GET /products.json
  def index
    @edit_mode = 'si' if (params[:e] == 'si')
    @products =
    if params[:search]
      Product.search(params[:search])
    elsif params[:group]
      Product.where(group: params[:group])
    elsif params[:subgroup]
      Product.where(subgroup: params[:subgroup])
    else
      Product.order('priority desc').first(50)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def hide
    id = params[:id]
    pr = Product.find_by(id: id)
    result = "OK, hidding...#{pr&.code} #{pr&.name}"
    if pr.blank?
      result = 'ERROR unable to find product with id ' + id
    elsif !pr.active
      result = 'ERROR already not active' 
    else
      pr.active = false
      saved = pr.save
      result = 'ERROR unable to save' unless saved
    end
    render json: { text: result, product_id: id }
  end


  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brief, :base_price, :discount, :sale_price, :stock, :second_class, :group, :subgroup, :priority, :hidden_msg, :active)
    end
end

