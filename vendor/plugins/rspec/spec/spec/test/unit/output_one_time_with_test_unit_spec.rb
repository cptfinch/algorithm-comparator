require File.dirname(__FILE__) + '/../../../spec_helper.rb'

module Spec
  module Runner
    describe CommandLine do
      it "should not output twice" do
        dir = File.dirname(__FILE__)
        output =`ruby #{dir}/output_one_time_with_test_unit_fixture_runner.rb`
        output.should include("1 example, 0 failures")
        output.should_not include("0 examples, 0 failures")
      end

      it "when no tests are run, does not output test/unit summary" do
        dir = File.dirname(__FILE__)
        output =`ruby #{dir}/output_one_time_with_test_unit_fixture_runner.rb`
        output.should_not include("Started")
        output.should_not include("tests")
        output.should_not include("assertions")
        output.should_not include("0 tests, 0 assertions, 0 failures, 0 errors")
      end

      it "when tests are run, output test/unit sumary" do
        dir = File.dirname(__FILE__)
        output =`ruby #{dir}/sample_spec_test.rb`
        output.should include("Started")
        output.should include("tests")
        output.should include("assertions")
        output.should include("1 tests, 1 assertions, 0 failures, 0 errors")
      end
    end
  end
end