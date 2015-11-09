require 'spec_helper'

RSpec.describe WorkflowableModel do
  it_behaves_like "Workflowable" do
    let(:workflowable_model) { WorkflowableModel.create }
  end
end

