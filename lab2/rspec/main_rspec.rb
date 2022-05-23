require 'rspec'
require_relative 'main'

RSpec.describe "greetings" do
  it "do ok for <18" do
    str = "Hello, Max Kovalskiy. You are younger then 18, but you can start programming just now!"
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18].each do |value|
      RSpec.expect(greetings("Max", "Kovalskiy", value)).to eq str
    end
  end
  it  "do wrong for >18" do
    str = "Hello, Max Kovalskiy. You are younger then 18, but you can start programming just now!"
    [19, 33, 44, 55].each do |value|
      RSpec.expect(greetings("Max", "Kovalskiy", value)).to eq str
    end
  end
end

RSpec.describe "foobar" do
  it "do incorrect fo a or b = 20" do
    RSpec.expect(foobar(20, 15)).to eq "35"
  end
end