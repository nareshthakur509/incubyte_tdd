require 'spec_helper'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe "#add" do
    context "when the input is an empty string" do
      it "returns 0" do
        input = ""
        output = 0
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains one number" do
      it "returns the number itself" do
        input = "1"
        output = 1
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains two numbers separated by a comma" do
      it "returns the sum of the numbers" do
        input = "1,5"
        output = 6
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains numbers separated by newlines" do
      it "returns the sum of the numbers" do
        input = "1\n2,3"
        output = 6
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains custom delimiters" do
      it "returns the sum of the numbers using the custom delimiter" do
        input = "//;\n1;2;3"
        output = 6
        expect(calculator.add(input)).to eq(output)
      end

      it "returns the sum of the numbers using another custom delimiter" do
        input = "//[***]\n1***2***3"
        output = 6
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains negative numbers" do
      it "raises an error with negative numbers not allowed message" do
        input = "1,-2,3,-4"
        expect { calculator.add(input) }.to raise_error("negative numbers not allowed -2,-4")
      end
    end

    context "when the input contains multiple numbers including zero" do
      it "returns the sum of all the numbers" do
        input = "0,1,2,3,4"
        output = 10
        expect(calculator.add(input)).to eq(output)
      end
    end

    context "when the input contains custom delimiters and newlines" do
      it "returns the sum of the numbers using multiple delimiters" do
        input = "//[***]\n1***2***3,4\n5"
        output = 15
        expect(calculator.add(input)).to eq(output)
      end
    end
  end
end






