module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze
  TEST_ACTION = { edit: 'Edit Test: ', create: 'Create New Test' }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    @test.persisted? ? TEST_ACTION[:edit] + test.title : TEST_ACTION[:create]
  end
end
