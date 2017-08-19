require 'test_helper'

class GroupDecoratorTest < ActiveSupport::TestCase
  def setup
    @group = Group.new.extend GroupDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
