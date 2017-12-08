# RSpec.describe Stringer do
#   it "has a version number" do
#     expect(Stringer::VERSION).not_to be nil
#   end

#   it "does something useful" do
#     expect(false).to eq(true)
#   end
# end

require_relative "spec_helper"
RSpec.describe Stringer do
  it "concatenates undefined number of strings with a space" do 
    expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end

  it "shorten a strings length to the declared input" do
    expect(Stringer.minify("STOP HERE NOT HERE", 9)).to eq("STOP HERE")
    expect(Stringer.minify("hello", 20)).to eq("hello")
    expect(Stringer.minify("hello", 0)).to eq("")
  end

  it "Take in a string, a word to find, and a word to replace, returns a string with the find words change to the replace words" do
    expect(Stringer.replacify("I can't do this", "can't", "can")).to eq("I can do this")
  end

  it "Parameters string (original), string (word to remove). Remove each instance of the second parameter within the original string." do
    expect(Stringer.removify("I'm not a developer", "not")).to eq("I'm a developer ")
  end
end