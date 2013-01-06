# coding: utf-8
require 'spec_helper'

describe HtmlCompilerHelper do

  describe '#bu_plugin_amazon_image' do
    subject { helper.bu_plugin_amazon_image('asin_str') }
    it { should match(/product\/asin_str\//) }
    it { should match(/creativeASIN=asin_str">/) }
    it { should match(/ASIN=asin_str/) }
    it { should match(/a=asin_str"/) }
  end

  describe '#amazon_iframe' do
    it { helper.amazon_iframe('asin_str').should match(/asins=asin_str/) }
  end

  describe '#amazonid' do
    it { helper.amazonid.should eq 'bukt-22' }
  end
end

