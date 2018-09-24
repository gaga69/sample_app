class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_form_params)
    if @contact.save
      flash[:success] = "Contact form sent. Thanks!"
      ContactMailer.contact_mail(@contact).deliver
      ContactMailer.recieved_contact(@contact).deliver
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private

    def contact_form_params
      params.require(:contact).permit(:name, :email, :content, :age)
    end

end
