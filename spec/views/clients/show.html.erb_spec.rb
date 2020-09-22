# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/show', type: :view do
  before(:each) do
    @client = assign(:client, create(:client))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{@client.name}/)
  end
end
