require 'rspec'
require_relative 'main'

RSpec.describe "closeOnCS" do
  it "do ok for close on CS" do
    str = "wefwspfspfCS"
    RSpec.expect(closeOnCS(str)).to eq 2 ** str.length
  end
  it  "do ok for no close on CS" do
    str = "aspfapsfpas"
    RSpec.expect(closeOnCS(str)).to eq str.reverse
  end
end