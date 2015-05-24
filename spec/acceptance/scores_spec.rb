require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Score" do
  before do
    @score = create(:score)
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
end
