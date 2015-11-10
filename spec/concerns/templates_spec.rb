require 'spec_helper'

RSpec.describe TemplatesModel do
  it_behaves_like "Templates" do
    let(:template_model) { TemplatesModel.create name: Faker::Name.name}
  end
end
