class LineItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :product
  load_and_authorize_resource :line_item, through: :product
  
  # POST /line_items
  # POST /line_items.json
  def create
    # @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.product, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item.product, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def line_item_params
      params.require(:line_item).permit(:product_id, :price, :quantity, :user_id)
    end
end
