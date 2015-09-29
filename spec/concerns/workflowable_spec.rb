require 'spec_helper'

class WorkflowableModel < Cms::Models::Document
  include Workflowable
end

describe Workflowable do
  let(:workflowable_model) { WorkflowableModel.create }
  
  it "should have state field" do
    expect(WorkflowableModel.fields.keys).to include('state')
  end
  
  it "should be initial state new" do
    expect(workflowable_model.state).to eq('new')
  end
  
  it "should change state new to dev if submit" do
    workflowable_model.submit!
    expect(workflowable_model.state).to eq('dev')
  end
  
  it "should change state dev to preview if submit for review" do
    workflowable_model = WorkflowableModel.create state: 'dev'
    workflowable_model.review!
    expect(workflowable_model.state).to eq('preview')
  end
  
  it "should change state review to publish if accept " do
    workflowable_model = WorkflowableModel.create state: 'preview'
    workflowable_model.accept!
    expect(workflowable_model.state).to eq('publish')
  end
  
  it "should change state review to dev if reject" do
    workflowable_model = WorkflowableModel.create state: 'preview'  
    workflowable_model.reject!
    expect(workflowable_model.state).to eq('dev')
  end
end
