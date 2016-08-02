class ContactsController < ApplicationController
  prawnto :prawn => { :top_margin => 75 }

  def index
    @contacts = Contact.all
    @nb_contacts = Contact.nb_contacts
    render template: 'contact/index'
  end

  def show
    contact_id = params[:id]

    @contact = Contact.find(contact_id)
    render template: 'contact/show'
  end

  def new
    @contact = Contact.new(params[:contact])
    render template: 'contact/new'
  end

  def create
    begin
      @contact = Contact.new(contact_params)
      result = @contact.save

      if result
        redirect_to action: "index",notice: 'contact was successfully created.'
      else
        render 'new'
      end
    rescue Exception => e
      render :status => :internal_server_error, :json => e.message
    end
  end

  def delete
    begin
      contact_id = params[:id]

      del_contact = Contact.find(contact_id)
      if del_contact.destroy
          redirect_to action: "index", notice: 'contact was successfully destroyed.'
      else
        render_error "delete_error", del_contact.errors.full_messages
      end
    rescue Exception => e
      render :status => :internal_server_error, :json => e.message
    end
  end

  def edit
    contact_id = params[:id]

    @contact = Contact.find(contact_id)
    render template: 'contact/edit'
  end

  def update
    begin
      contact_id = params[:id]

      @contact = Contact.find(contact_id)
      result = @contact.update(contact_params)
      if result
        redirect_to action: "index",notice: 'contact was successfully updated.'
      else
        render 'edit'
      end
    rescue Exception => e
      render :status => :internal_server_error, :json => e.message
    end
  end

  def change_flag
    begin
      contact_id = params[:id]

      @contact = Contact.find(contact_id)
      if @contact.flag.blank? || @contact.flag == false
        result = @contact.update(:flag => true)
      else
        result = @contact.update(:flag => false)
      end

      if result
        redirect_to action: "index",notice: 'contact flag was successfully updated.'
      else
        render_error "change_flag_error", del_contact.errors.full_messages
      end
    rescue Exception => e
      render :status => :internal_server_error, :json => e.message
    end
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone, :address, :email)
  end
end
