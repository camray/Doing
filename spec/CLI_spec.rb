require 'spec_helper'
require 'doing/cli'

describe Doing::CLI do

  before(:each) do
    @file_location = "doing.markdown"
    File.delete(@file_location) if File.exist?(@file_location)
  end

  it "Can create blank todo list" do
    Doing::CLI.start ['create']
    expect(File.exists?(@file_location)).to eq(true)
  end

  it "Can create reset the todo list" do
    Doing::CLI.start ['create']
    expect(File.exists?(@file_location)).to eq(true)

    Doing::CLI.start ['reset']
    expect(File.exists?(@file_location)).to eq(true)

    File.delete(@file_location) if File.exist?(@file_location)

    Doing::CLI.start ['reset']
    expect(File.exists?(@file_location)).to eq(true)
  end

end
