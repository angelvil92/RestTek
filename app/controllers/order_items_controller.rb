class OrderItemsController < ApplicationController

	def index
		@order_items = OrderItem.all
		authorize @order_items
	end

	def show
		@order_item = OrderItem.find_by(id: params[:id])
		authorize @order_item
	end

	def new
		@order_item = OrderItem.new
		authorize @order_item
	end

	def create
		@order_item = OrderItem.new order_item_params
		if @order_item.save
			redirect_to order_items_path
		else
			@errors = @order_item.errors.full_messages
			render 'new'
		end
	end

	def update
		@order_item = OrderItem.find params[:id]
		if @order_item.update order_item_params
			redirect_to order_items_path
		else
			render 'edit'
		end
	end

	def edit
		@order_item = OrderItem.find params[:id]
		authorize @order_item
	end

	def destroy
		@order_item = OrderItem.find params[:id]
		authorize @order_item
		@order_item.destroy!
		redirect_to order_items_path
	end

	private
	def order_item_params
		return params.require(:order_item).permit(:notes, :order_id, :item_id)
	end

end
