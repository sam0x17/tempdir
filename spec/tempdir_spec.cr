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

  it "creates directory prefixes correctly" do
    dir = TempDir.new "great-prefix"
    File.exists?(dir.path).should eq true
    File.basename(dir.path).starts_with?("great-prefix").should eq true
  end

  it "works correctly with the block-style create option" do
    path_unscoped = ""
    TempDir.create do |path|
      File.exists?(path).should eq true
      path_unscoped = path
    end
    File.exists?(path_unscoped).should eq false
  end
end
