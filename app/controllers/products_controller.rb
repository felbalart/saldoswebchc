class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:hide, :add_substitute]

  # GET /products
  # GET /products.json
  def index
    @tag = params[:tag].blank? ? 'products' : params[:tag]
    @products = Product.with_tag(@tag)
    raise ActionController::RoutingError.new('Not Found') if @products.empty?
    @edit_mode = 'si' if (params[:e] == 'si')
    @products =
    if params[:search]
      @products.search(params[:search])
    elsif params[:group]
      @products.where(group: params[:group])
    elsif params[:subgroup]
      @products.where(subgroup: params[:subgroup])
    else
      @products.first(50)
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

  def add_component
    father = Product.find(params[:father_id])
    child = Product.find(params[:child_id])
    children = father.components.to_a
    raise 'Already present' if children.include? child
    father.components << child
    father.save!
    render plain: 'Actualizado: Agregado'
  end

  def remove_component
    father = Product.find(params[:father_id])
    child = Product.find(params[:child_id])
    children = father.components.to_a
    raise 'Component not found' unless children.include? child
    father.components.delete(child)
    father.save!
    render plain: 'Actualizado: Removido'
  end

  # deprecated
  def tag_index
    @tag = params[:tag]
    @products = Tag.where(word: @tag).map(&:product)
    raise ActionController::RoutingError.new('Not Found') if @products.empty?
    render :index
  end

  def add_substitute
    sub_name = params['substitute_name']
    sub_author = params['substitute_author']
    @product = Product.find(params['product_id'].to_i)
    if sub_name.to_s.length < 9 || sub_author.to_s.length < 6
      raise ActionController::BadRequest.new('Invalid Substitute Data')
    end
    @substitute = @product.substitutes.create!(name: sub_name, author: sub_author, active: true)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :code, :brief, :base_price, :discount, :sale_price, :stock, :second_class,
        :group, :subgroup, :priority, :hidden_msg, :active, :image_url, :datasheet_url)
    end
end

