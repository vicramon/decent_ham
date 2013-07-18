# Decent Ham

Decent Ham generates crud for rails apps using decent_exposure and haml.

## Installation

    gem 'decent_ham'

## Usage

First create and run a migration. Then, run the following code in your console:

    $ rails generate decent_ham <resource_name>

Fill in `<resource_name>` with whatever your resource is (e.g. users, posts, etc.)

Viola! Now you have some awesome crud.

## Sample Output

Here's an example of what you would get:

### Model

    # app/models/user.rb

    class User < ActiveRecord::Base

    end

### Controller

    # app/controllers/users_controller.rb

    class UsersController < ApplicationController
        expose(:users)
        expose(:user)

        def create
            if user.update_attributes(user_params)
            redirect_to user, notice: "Your changes have been saved."
            else
            flash.now[:error] = "Sorry, but something went wrong"
            render :new
            end
        end
        alias update create

        def destroy
            user.destroy
            redirect_to :users
        end

        private

        def user_params
            # make sure to whitelist attributes as necessary
            params.require(:user).permit(:name, :email, :active, :description, )
        end

    end

### Views

    pending

