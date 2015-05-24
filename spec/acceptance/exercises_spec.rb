require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Exercise" do
  before do
    @exercise = create(:exercise)
  end

  # get INDEX docs
  get "/api/v1/exercises" do

    example "Listing exercises" do
      do_request

      expect(status).to eq 200
    end

    parameter :name, "Name of the last record on the previous page", required: false, scope: :from
    let(:name) { "b" }
    example "Listing exercises from the letter B (pagination)" do
      explanation "This uses the paginative gem for pagination by showing only the records after the record you pass in."

      expect(params).to eq({ from: { name: "b" } }.as_json)
    end
  end

  # get SHOW docs
  get "/api/v1/exercises/:id" do
    let(:id) { @exercise.id }

    example "Get a specific exercise" do
      do_request

      expect(status).to eq 200
    end
  end
end
