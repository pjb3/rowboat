require 'minitest/autorun'
require 'rowboat'

class RowboatTest < MiniTest::Unit::TestCase
  def test_simple_parse_column_name
    assert_equal :name, Rowboat.parse_column_name("name")
  end

  def test_nested_1_parse_column_name
    assert_equal({ person: :name }, Rowboat.parse_column_name("person.name"))
  end

  def test_nested_2_parse_column_name
    assert_equal({ person: { address: :zip } }, Rowboat.parse_column_name("person.address.zip"))
  end

  def test_simple
    rows = []
    rows << ["Paul", "mail@paulbarry.com"]
    rows << ["Test", "test@example.com"]
    rowboat = Rowboat.new(["name", "email"], rows)
    expected = [
      { name: "Paul", email: "mail@paulbarry.com" },
      { name: "Test", email: "test@example.com" }
    ]
    assert_equal expected, rowboat.to_a
  end

  def test_nested
    rows = []
    rows << ["Paul", "mail@paulbarry.com"]
    rows << ["Test", "test@example.com"]
    rowboat = Rowboat.new(["person.name", "person.email"], rows)
    expected = [
      { person: { name: "Paul", email: "mail@paulbarry.com" } },
      { person: { name: "Test", email: "test@example.com" } }
    ]
    assert_equal expected, rowboat.to_a
  end
end
