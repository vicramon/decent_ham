class <%= plural_name.capitalize %>Controller < ApplicationController
  expose(:<%= plural_name %>)
  expose(:<%= singular_name %>)

  def create
    if <%= singular_name %>.update_attributes(<%= singular_name %>_params)
      redirect_to <%= singular_name %>, notice: "Your changes have been saved."
    else
      flash.now[:error] = "Sorry, but something went wrong"
      render :new
    end
  end
  alias update create

  def destroy
    <%= singular_name %>.destroy
    redirect_to :<%= plural_name %>
  end

  private

  def <%= singular_name %>_params
    # make sure to whitelist attributes as necessary
    params.require(:<%= singular_name %>).permit(<% @attributes.each do |attribute| %>:<%= attribute.name %>, <% end %>)
  end

end
