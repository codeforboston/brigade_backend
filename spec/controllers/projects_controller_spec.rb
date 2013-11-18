require 'spec_helper'

describe ProjectsController do
  include Devise::TestHelpers

  before do
    user = User.create name: 'Test User', email: 'example@example.com', password: 'changeme', password_confirmation: 'changeme'
    sign_in user

    @project = Project.create(name: 'test', url: 'http://test.com', repository: 'http://github.com/test/test', description: 'test project')
  end
  it "can retrieve a project" do
    get :show, id: @project.id, format: :json
    project = assigns[:project]
    project.name.should == 'test'
    response.body.should == ProjectSerializer.new(project).to_json
  end
end
