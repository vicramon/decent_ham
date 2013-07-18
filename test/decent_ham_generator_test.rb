require 'test_helper'

class DecentHamTest < Rails::Generators::TestCase
  tests DecentHam::DecentHamGenerator

  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :setup

  def setup
    prepare_destination
    @decent_ham = generator(["users"])
  end

  test "it creates the model" do
    @decent_ham.create_model
    assert_file "app/models/user.rb", /class User < ActiveRecord::Base/
  end

  test "it creates the controller" do
    @decent_ham.create_controller
    assert_file "app/controllers/users_controller.rb", /class UsersController < ApplicationController/
  end

  test "it creates the views" do
    @decent_ham.create_views
    assert_file "app/views/users/index.html.haml", /All Users/ 
    assert_file "app/views/users/show.html.haml", /View User/
    assert_file "app/views/users/new.html.haml", /= render 'form'/
    assert_file "app/views/users/edit.html.haml", /= render 'form'/
    assert_file "app/views/users/_form.html.haml", /= form_for users  do |f|/
  end

  test "it adds the routes" do
    @decent_ham.create_file("config/routes.rb", "Fake::Application.routes.draw do \n\n end")
    @decent_ham.add_route
    assert_file "config/routes.rb", /resources :users/
  end

end
