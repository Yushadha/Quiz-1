class ContactsController < ApplicationController
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

	def edit
		@contact = Contact.find params[:id]
	end

	def update
		@contact = Contact.find params[:id] 
		@contact.update support_params
		redirect_to contacts_path
	end

	def delete
		@contact = Contact.find params[:id]
		@contact.destroy
	end

	def destroy
		@contact = Contact.find params[:id]
		@contact.destroy
		redirect_to contacts_path
	end

	private

	def support_params
		params.require(:contact).permit(:name, :email, :department, :message)
	end
end
