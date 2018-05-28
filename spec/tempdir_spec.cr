require "./spec_helper"

describe TempDir do
  it "creates a proper directory with default options" do
    dir = TempDir.new
    File.exists?(dir.path).should eq true
  end

  it "deletes directory when delete method is called" do
    dir = TempDir.new
    File.exists?(dir.path).should eq true
    dir.delete
    File.exists?(dir.path).should eq false
  end
end
