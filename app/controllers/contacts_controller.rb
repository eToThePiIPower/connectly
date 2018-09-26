class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :create_user_contact, only: [:create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = current_user.contacts.new
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts
  # POST /contacts.json
  def create
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: success_notice }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to contacts_path, alert: 'Contact not found in your collection'
  end

  def create_user_contact
    @contact = current_user.contacts.new(contact_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :email, :notes)
  end

  def success_notice
    "Successfully added #{@contact.name} to your contacts."
  end
end
