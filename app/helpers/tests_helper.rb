module TestsHelper
  def test_header(test)
    test.persisted? ? 'Edit Test' : 'Create New Test'
  end
end
