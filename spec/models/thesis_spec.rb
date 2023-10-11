# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Thesis do
  describe ".properties" do
    it do
      expect(described_class.properties.keys.sort).to match_array ["has_model", "create_date", "modified_date", "head", "tail", "depositor", "title", "date_uploaded", "date_modified", "state", "proxy_depositor", "on_behalf_of", "arkivo_checksum", "owner", "contact_email", "contact_phone", "department", "alternative_title", "label", "relative_path", "import_url", "resource_type", "creator", "contributor", "description", "abstract", "keyword", "license", "rights_notes", "rights_statement", "access_right", "publisher", "date_created", "subject", "language", "identifier", "based_near", "related_url", "bibliographic_citation", "source", "is_child"].sort
    end
  end

  describe "validations" do
    subject { FactoryBot.build(:thesis, title: title) }
    context "when title is an empty array" do
      let(:title) { [] }
      it { is_expected.not_to be_valid }
    end

    context "when title is an array with one string" do
      let(:title) { ["My title"] }
      it { is_expected.to be_valid }
    end
  end
end
