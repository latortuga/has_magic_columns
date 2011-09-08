require 'spec_helper'
require 'has_magic_columns/active_record'
require 'finders/activerecord_test_connector'

ActiverecordTestConnector.setup
abort unless ActiverecordTestConnector.able_to_connect

describe HasMagicColumns do
  extend ActiverecordTestConnector::FixtureSetup

  fixtures :people, :accounts, :users

  context "on a single model" do
    before(:each) do
      @charlie = people(:charlie)
    end

    it "initializes magic columns correctly" do
      @charlie.should_not be_nil
      @charlie.class.should be(Person)
      @charlie.magic_columns.should_not be_nil
    end

    it "allows adding a magic column" do
      @charlie.magic_columns.create(:name => 'salary')
      @charlie.magic_columns.length.should be(1)
    end

    it "allows setting and saving of magic attributes" do
      @charlie.magic_columns.create(:name => 'salary')
      @charlie.salary = 50000
      @charlie.save
      @charlie = Person.find(people(:charlie).id)
      @charlie.salary.should_not be_nil
    end

    #it "forces required if is_required is true" do
    #  # TODO figure out why this fails
    #  @charlie.magic_columns.create(:name => "last_name", :is_required => true)
    #  @charlie.save.should be_false
    #end
      
    it "allows datatype to be :date" do
      @charlie.magic_columns.create(:name => "birthday", :datatype => :date)
      @charlie.birthday = Date.today
      @charlie.save.should be_true
    end

    it "allows datatype to be :datetime" do
      @charlie.magic_columns.create(:name => "signed_up_at", :datatype => :datetime)
      @charlie.signed_up_at = DateTime.now
      @charlie.save.should be_true
    end

    it "allows datatype to be :integer" do
      @charlie.magic_columns.create(:name => "age", :datatype => :integer)
      @charlie.age = 5
      @charlie.save.should be_true
    end

    it "allows datatype to be :check_box_boolean" do
      @charlie.magic_columns.create(:name => "retired", :datatype => :check_box_boolean)
      @charlie.retired = false
      @charlie.save.should be_true
    end

    it "allows default to be set" do
      @charlie.magic_columns.create(:name => "bonus", :default => "40000")
      @charlie.bonus.should == "40000"
    end

    it "allows a pretty display name to be set" do
      @charlie.magic_columns.create(:name => "zip", :pretty_name => "Zip Code")
      @charlie.magic_columns.last.pretty_name.should == "Zip Code"
    end
  end

  context "in a parent-child relationship" do
    before(:each) do
      @alice = users(:alice)
      @account = accounts(:important)
    end

    it "initializes magic columns correctly" do
      @alice.should_not be_nil
      @alice.class.should be(User)
      @alice.magic_columns.should_not be_nil

      @account.should_not be_nil
      @account.class.should be(Account)
      @alice.magic_columns.should_not be_nil
    end

    it "allows adding a magic column to the child" do
      @alice.magic_columns.create(:name => 'salary')
      lambda{@alice.salary}.should_not raise_error
      lambda{@account.reload_with_magic.salary}.should_not raise_error
    end

    it "allows adding a magic column to the parent" do
      @account.magic_columns.create(:name => 'age')
      lambda{@alice.reload_with_magic.age}.should_not raise_error
    end

    it "sets magic columns for all child models" do
      @bob = users(:bob)
      @bob.magic_columns.create(:name => 'birthday')
      @alice.reload_with_magic
      lambda{@alice.birthday}.should_not raise_error
    end
  end
end
