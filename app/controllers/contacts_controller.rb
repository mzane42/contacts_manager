class ContactsController < ApplicationController
=begin
  def create

  end

  def update

  end

  def delete

  end

  def view

  end

  def index

  end
=end

  def new
    @new_contact = Contact.new(params[:contact])
    render template: 'contact/new'
  end

  def create
    begin
      @new_contact = Contact.new(contact_params)
      result = @new_contact.save

      puts result

      if result
        redirect_to action: "index",notice: 'contact was successfully created.'
      else
        render_error "create_error", new_contact.errors.full_messages
      end
    rescue Exception => e
      render :status => :internal_server_error, :json => e.message
    end
  end

  def index
    render template: 'contact/index'
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :address, :email)
  end
end
