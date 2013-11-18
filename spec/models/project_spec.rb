require 'spec_helper'

describe Project do
  let(:project) { Project.create(name: 'test', repository: 'test_repo') }
  it "returns a project's github details" do
    repo = double(name: 'test_repo')
    Connectors::Github.stub(:repositories) { [double(name: 'not_the_repo'), repo, double(name: 'also_not_it')] }
    expect(project.github_details).to equal repo
  end
end
