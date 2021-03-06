require './example_setup'

require 'flipper'
require 'flipper/adapters/memory'

adapter = Flipper::Adapters::Memory.new
flipper = Flipper.new(adapter)
stats = flipper[:stats]

# Some class that represents what will be trying to do something
class User
  attr_reader :id

  def initialize(id)
    @id = id
  end
end

pitt = User.new(1)
clooney = User.new(10)

puts "Stats for pitt: #{stats.enabled?(flipper.actor(pitt))}"
puts "Stats for clooney: #{stats.enabled?(flipper.actor(clooney))}"

puts "\nEnabling stats for 5 percent...\n\n"
stats.enable(Flipper::Types::PercentageOfActors.new(5))

puts "Stats for pitt: #{stats.enabled?(flipper.actor(pitt))}"
puts "Stats for clooney: #{stats.enabled?(flipper.actor(clooney))}"

puts "\nEnabling stats for 15 percent...\n\n"
stats.enable(Flipper::Types::PercentageOfActors.new(15))

puts "Stats for pitt: #{stats.enabled?(flipper.actor(pitt))}"
puts "Stats for clooney: #{stats.enabled?(flipper.actor(clooney))}"
