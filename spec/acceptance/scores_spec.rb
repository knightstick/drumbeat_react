require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Score" do
  before do
    @score = create(:score)
    @exercise = create(:exercise)
    @user = create(:user)
  end

  context 'with authentication' do
    let(:user_email) { @user.email }
    let(:user_token) { @user.authentication_token }

    header 'X-User-Email', :user_email
    header 'X-User-Token', :user_token

    # get INDEX docs
    get "/api/v1/scores" do

      example "Listing scores" do
        do_request

        expect(status).to eq 200
      end
    end

    # get SHOW docs
    get "/api/v1/scores/:id" do
      let(:id) { @score.id }

      example "Get a specific score" do
        do_request

        expect(status).to eq 200
      end
    end

    # post CREATE
    post "/api/v1/exercises/:exercise_id/scores" do
      let(:exercise_id) { @exercise.id }
      parameter :discipline, 'The type of score, i.e. 4 bars long', scope: :score
      parameter :score, 'The numeric score acheived', scope: :score
      let(:discipline) { 'bars_4'}
      let(:score) { 120 }

      example "Set a score for an exercise" do
        do_request
        puts response_body
        expect(status).to eq 201
      end
    end
  end
end
