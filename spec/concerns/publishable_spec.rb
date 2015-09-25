require 'spec_helper'

class PublishableModel < Cms::Models::Document
  include Publishable
end

describe Publishable do
  let(:publishable_model) { PublishableModel.create }
  
  it "should have status" do
    expect(PublishableModel.fields.keys).to include('state')
  end
  
  it "should be initial state new" do
    expect(publishable_model.state).to eq('new')
  end
  
  it "should be state dev after submit" do
    publishable_model.submit!
    expect(publishable_model.state).to eq('dev')
  end
  
  it "should change state preview when submit for review" do
    publishable_model.submit!
    publishable_model.review!
    expect(publishable_model.state).to eq('preview')
  end
  
  it "should change state review to publish if accept " do
    publishable_model.submit!
    publishable_model.review!
    publishable_model.accept!
    expect(publishable_model.state).to eq('publish')
  end
  
  it "should change state review to dev if reject" do
    publishable_model.submit!
    publishable_model.review!
    publishable_model.reject!
    expect(publishable_model.state).to eq('dev')
  end
   
end
