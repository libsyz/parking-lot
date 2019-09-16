require 'rspec'
require_relative './../validator'


describe Validator do
  describe "#validate" do
    it "contains an array of the following valid vehicle types - car, motorbike, truck, bus" do
      expect(Validator::VEHICLES.sort).to eq %w(car motorbike truck bus).sort
    end

    before(:each) do
      @mock = Class.new
      @mock.extend(Validator)
      @error_msg = 'Sorry, I could not make sense of your input!'
    end

    context "when passing more than 3 words" do
      it "returns an error message" do
        input = "this is not your usual request"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "when passing less than 3 words" do
      it "returns an error message" do
        input = "two words"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "correct entry input -> ENTRY XX33XXXX car" do
      it "success - returns request hash" do
        input = "ENTRY XX33XXXX car"
        expect(@mock.validate(input)).to eq ({ action: "ENTRY",
          vehicle: "car",
          plate: "XX33XXXX" })
      end
    end


    context "correct entry input -> ENTRY BB11BBBB truck" do
      it "success - returns request hash" do
        input = "ENTRY BB11BBBB truck"
        expect(@mock.validate(input)).to eq ({ action: "ENTRY",
          vehicle: "truck",
          plate: "BB11BBBB" })
      end
    end


    context "correct exit input -> EXIT BB11BBBB" do
      it "success - returns request params" do
        input = "EXIT BB11BBBB"
        expect(@mock.validate(input)).to eq ({ action: "EXIT",
          vehicle: nil,
          plate: "BB11BBBB" })
      end
    end

    context "incorrect entry input -> ENTRYR XX33XXXX car" do
      it "error - returns error message" do
        input = "ENTRYR XX33XXXX car"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "incorrect entry input -> ENTRY XX33X3XX car" do
      it "error - returns error message" do
        input = "ENTRY XX33X3XX car"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "incorrect entry input -> ENTRY XX33XXXX carl" do
      it "error - returns error message" do
        input = "ENTRY XX33XXXX carl"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "incorrect exit input -> EXIS XX33XXXX" do
      it "error - returns error message" do
        input = "EXIS XX33XXXX"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end

    context "correct entry input with trailing space -> ENTRY LW34ACVD truck  " do
      it "success - returns request hash" do
        input = "  ENTRY LW34ACVD truck  "
        expect(@mock.validate(input)).to eq ({ action: "ENTRY",
          vehicle: "truck",
          plate: "LW34ACVD" })
      end
    end

    context "incorrect entry input order -> LW34ACVD truck ENTRY" do
      it "success - returns request hash" do
        input = "LW34ACVD truck ENTRY"
        expect(@mock.validate(input)).to eq @error_msg
      end
    end
  end
end
