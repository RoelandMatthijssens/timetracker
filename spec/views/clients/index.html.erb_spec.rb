# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/index', type: :view do
  before(:each) do
    assign(:clients, [
             create(:client),
             create(:client)
           ])
  end

  it 'renders a list of clients' do
    render
    assert_select 'tbody>tr', 2
  end
end
