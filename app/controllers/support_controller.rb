class SupportController < ApplicationController
	
	def create
		@contact = Contact.new support_params
			@contact.save
			render text: "sorry Tam, no fancy redirect here"
	end

	private

	def support_params
		params.require(:contact).permit(:name, :email, :department, :message)
	end

end
