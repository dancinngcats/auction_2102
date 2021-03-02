require_relative 'test_helper'

class AttendeeTest < Minitest::Test

  def setup
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
  end

  def test_it_exists
    assert_instance_of Attendee, @attendee
  end

  def test_it_has_attributes
    assert_equal "Megan", @attendee.name
    assert_equal 50, @attendee.budget
  end
end
