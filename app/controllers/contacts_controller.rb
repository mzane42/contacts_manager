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

  def create
    begin
      first_name = (params[:first_name]) ? params[:first_name] : nil
      last_name = (params[:last_name]) ? params[:last_name] : nil
      email = (params[:email]) ? params[:email] : nil
      phone = (params[:phone]) ? params[:phone] : nil
      address = (params[:address]) ? params[:address] : nil

      new_contact = Contact.new(first_name: first_name, last_name: last_name, email: email, phone: phone, address: address)
      result = new_contact.save


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

end
