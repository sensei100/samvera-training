# frozen_string_literal: true

require "bulkrax/entry_spec_helper"

RSpec.describe Bulkrax::CsvParser do
  subject(:entry) do
    Bulkrax::EntrySpecHelper.entry_for(
      data: data,
      identifier: data.fetch(:source_identifier),
      parser_class_name: 'Bulkrax::CsvParser',
      parser_fields: { 'import_file_path' => "spec/fixtures/csv/simple.csv" }
    )
  end

  let(:data) do {
    extent: "hello there",
    source_identifier: "alpha", 
    model: "Image",
    title: "Test Title",
  } end

  it "runs a test" do
    expect(true).to eq true
  end

  it "assigns a factory_class" do
    entry.build_metadata
    expect(entry.factory_class).to eq(Image)
    expect(entry.parsed_metadata.fetch("extent")).to eq(["hello there"])
  end
end
