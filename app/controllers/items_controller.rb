class ItemsController < ApplicationController
 
	def index
		# @items = Item.all
		@items = policy_scope(Item)
		authorize @items
	end

	def items_filtered_by_category
		# @items = policy_scope(Item)
		@items = Item.filter_items_by_category params[:category]
		render 'index'
	end

	def show
		@item = Item.find_by(id: params[:id])
		@order = current_user.orders.find_by(paid: false) || Order.create(user: current_user)
		authorize @item
	end

	def new
		@item = Item.new
		authorize @item
	end

	def create
		@item = Item.new item_params
		if @item.save
			redirect_to items_path
		else
			@errors = @item.errors.full_messages
			render 'new'
		end
	end

	def update
		@item = Item.find params[:id]
		if @item.update item_params
			redirect_to items_path
		else
			render 'edit'
		end
	end

	def edit
		@item = Item.find params[:id]
		authorize @item
	end

	def destroy
		@item = Item.find params[:id]
		authorize @item
		@item.destroy!
		redirect_to items_path
	end


	private
	def item_params
		return params.require(:item).permit(:name, :description, :price, :available, :published, :category_id)
	end

end
