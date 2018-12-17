require('minitest/autorun')
require('minitest/rg')
require_relative('owner.rb')
require_relative('animal.rb')


class TestOwner < Minitest::Test

  def test_owner_has_name
    owner = Owner.new("Mary")
    assert_equal("Mary", owner.name)
  end
end
