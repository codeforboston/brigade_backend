require 'spec_helper'

describe User do
  it { should have_many(:authorizations).dependent(:destroy) }
  it { should accept_nested_attributes_for(:authorizations) }

end
