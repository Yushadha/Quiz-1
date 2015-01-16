class ContactController < ApplicationController
	
	def index
		@contact = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new support_params
			@contact.save
			if @contact.save
			redirect_to contacts_path
			else
			render :new
		end
	end

	private

	def support_params
		params.require(:contact).permit(:name, :email, :department, :message)
	end

	def edit
		@contact = Contact.find params[:id]
	end


end
