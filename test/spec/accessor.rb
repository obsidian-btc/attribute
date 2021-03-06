require_relative 'spec_init'

module Accessor
  class Example
    include ::Proof::Attribute

    Attribute::Define.(self, :some_attr, :accessor)
  end
end

context "Attribute" do
  test "Is an accessor" do
    example = Accessor::Example.new
    assert(example.accessor? :some_attr)
  end
end
