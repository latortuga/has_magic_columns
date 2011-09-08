require 'spec_helper'
require File.expand_path('./activerecord_test_connector',__FILE__)

ActiverecordTestConnector.setup
abort unless ActiverecordTestConnector.able_to_connect

describe HasMagicColumns do

  extend ActiverecordTestConnector::FixtureSetup

  fixtures :people

  Person.class_eval
    has_magic_columns
  end

  it "adds a magic column" do
    @charlie = people(:charlie)
    @charlie.magic_columns.create(:salary => "50000")
    @charlie.magic_columns.length should_be(1)
  end
end
