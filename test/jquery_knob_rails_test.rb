require 'test_helper'

class JqueryKnobRailsTest < ActionDispatch::IntegrationTest

  test "Load engine" do
    assert_equal ::Rails::Engine, Knob::Rails::Engine.superclass
  end

  test "JavaScript found" do
    get "/assets/jquery.knob.js"
    assert_knob(response)
  end

  test "JavaScript is available in a JS require" do
    get "/assets/javascript-require.js"
    assert_knob(response)
  end

  test "helpers should be available in the view" do
    get "/circles"
    assert_response :success
    puts response.body
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end

  def assert_knob(response)
    assert_response :success
    assert_match(/jQuery Knob/, response.body)
  end
end
