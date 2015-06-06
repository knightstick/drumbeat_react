require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Exercise" do
  before do
    @exercises = create_list(:exercise, 3)
    @user = create(:user)
  end

  context 'with authentication' do
    let(:user_email) { @user.email }
    let(:user_token) { @user.authentication_token }

    header 'X-User-Email', :user_email
    header 'X-User-Token', :user_token

    # get INDEX docs
    get "/api/v1/exercises" do

      example "Listing exercises" do
        do_request

        expect(status).to eq 200
      end
    end

    # get SHOW docs
    get "/api/v1/exercises/:id" do
      let(:id) { @exercises.first.id }

      example "Get a specific exercise" do
        do_request

        expect(status).to eq 200
      end
    end
  end
end
