ENV["RAILS_ENV"] = 'test'

require 'rails/all'
require 'rails/generators'
require 'test/unit'
require_relative '../lib/generators/decent_ham/decent_ham_generator'

# Simulate a user database table
class User
  def self.columns_hash
    { 
      'id' => OpenStruct.new(type: :string),
      'name' => OpenStruct.new(type: :string),
      'email' => OpenStruct.new(type: :string),
      'created_at' => OpenStruct.new(type: :datetime),
      'updated_at' => OpenStruct.new(type: :datetime),
      'active' => OpenStruct.new(type: :boolean),
      'money' => OpenStruct.new(type: :decimal),
      'description' => OpenStruct.new(type: :text),
      'birthdate' => OpenStruct.new(type: :date),
      'birthtime' => OpenStruct.new(type: :time),
      'bitcoins' => OpenStruct.new(type: :float),
      'stamp_time' => OpenStruct.new(type: :timestamp),
      'friend_id' => OpenStruct.new(type: :references),
    }
  end
end
