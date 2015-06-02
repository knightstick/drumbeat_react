require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Score" do
  before do
    @score = create(:score)
    @exercise = create(:exercise)
    @user = create(:user)
  end

  # get INDEX docs
  get "/api/v1/scores" do

    example "Listing scores" do
      do_request

      expect(status).to eq 200
    end

    parameter :name, "Name of the last record on the previous page", required: false, scope: :from
    let(:name) { "b" }
    example "Listing scores from the letter B (pagination)" do
      explanation "This uses the paginative gem for pagination by showing only the records after the record you pass in."

      expect(params).to eq({ from: { name: "b" } }.as_json)
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
  post "/api/v1/exercises/:id/scores" do
    let(:id) { @exercise.id }

    parameter :user_email, 'User email'
    parameter :user_token, 'Authentication token'
    let(:user_email) { @user.email }
    let(:user_token) { @user.authentication_token }

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
