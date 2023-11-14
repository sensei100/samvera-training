# frozen_string_literal: true

RSpec.describe GenericWorkIndexer do
  describe "#generate_solr_document" do
    let(:generate_solr_document_method) { described_class.instance_method(:generate_solr_document) }

    context "definition" do
      subject(:definition) { generate_solr_document_method.source_location.first }
      
      it { is_expected.to eq(IiifPrint::Engine.root.join("app/indexers/concerns/iiif_print/child_indexer.rb").to_s) }
    end

    context "super definition" do
      subject(:definition) { generate_solr_document_method.super_method.source_location.first }

      it { is_expected.to eq(Rails.root.join("app/indexers/app_indexer.rb").to_s) }
    end
  end
end