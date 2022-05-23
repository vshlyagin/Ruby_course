require 'rspec'
require_relative 'main'

RSpec.describe "greetings" do
  it "do ok for <18" do
    str = "Привет, Валентин Шлягин. Тебе меньше 18-ти лет, но начать учиться программировать никогда не рано"
    [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18].each do |value|
      RSpec.expect(greetings("Валентин", "Шлягин", value)).to eq str
    end
  end
  it  "do ok for >18" do
    str = "Привет, Валентин Шлягин. Самое время занятся делом"
    [19, 22, 34, 65].each do |value|
      RSpec.expect(greetings("Валентин", "Шлягин", value)).to eq str
    end
  end
end

RSpec.describe "foobar" do
  it "do incorrect fo a or b = 20" do
    RSpec.expect(foobar(20, 15)).to eq "35"
  end
end