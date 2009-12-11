require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Marker do
  it "should properly store the secret" do
    Marker.new("r g y b").secret.should == %W(r g y b)
    Marker.new("rgyb").secret.should == %W(r g y b)
  end
end