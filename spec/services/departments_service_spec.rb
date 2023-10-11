# frozen_string_literal: true

RSpec.describe DepartmentsService do
  describe ".select_all_options" do
    it "is an array of arrays" do
      expect(described_class.select_all_options).to eq [["English", "eng"], ["History", "hst"], ["Latin", "ltn"], ["Zoology", "zoo"]]
    end
  end

  describe ".label" do
    context "when id doesn't exist" do
      it "will raise an error" do
        expect {described_class.label("bio")}.to raise_error KeyError
      end
    end

    context "when id does exist" do
      it "will return a string" do
        expect(described_class.label("eng")).to eq "English"
      end
    end
  end
end