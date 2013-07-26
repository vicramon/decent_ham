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

```ruby
# app/models/user.rb

class User < ActiveRecord::Base

end
```

### Controller

```ruby
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
```

### Views


Index

```ruby
# app/views/users/index.html.haml

%section

  %article

    %h1 All Users

    = link_to "New user", new_user_path

    %table
      %thead
        %tr
          %td Name
          %td Email
          %td Active
          %td Description

          %td
      %tbody
        - users.each do |user|
          %tr
            %td= user.name
            %td= user.email
            %td= user.active
            %td= user.description

            %td
              = link_to "View", user
              |
              = link_to "Edit", edit_user_path(user)


```

Show

```ruby
# app/views/users/show.html.haml

%section

  %article

    %h1 View User

    = link_to "All Users", users_path
    |
    = link_to "Edit", edit_user_path(user)

    %table

      %tr
        %td Name
        %td= user.name

      %tr
        %td Email
        %td= user.email

      %tr
        %td Active
        %td= user.active

      %tr
        %td Description
        %td= user.description

```

New

```ruby
# app/views/users/new.html.haml

%section

  %article

    %h1 Create User

    = render 'form'


```

Edit

```ruby
# app/views/users/edit.html.haml

%section

  %article

    %h1 Edit User

    = render 'form'

    = link_to "Delete", user, method: :delete

```

Form partial

```ruby
# app/views/users/_form.html.haml

%section

  %article

    = form_for user do |f|
      %fieldset

        %dl
          %dt= f.label :name
          %dd= f.text_field :name

        %dl
          %dt= f.label :email
          %dd= f.text_field :email

        %dl
          %dt= f.label :active
          %dd= f.check_box :active

        %dl
          %dt= f.label :description
          %dd= f.text_area :description

      %fieldset.actions
        = f.submit
```
