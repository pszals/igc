# coding: utf-8
require 'spec_helper'

describe IGC::Reader do

  before do
    @igc = IGC::Reader.new('spec/support/cpilot.igc')
  end

  it 'should read from a file' do
    @igc.contents.should_not == nil
  end

  it 'should have a date' do
    expected_date = Date.strptime('070512','%d%m%y')
    @igc.date.should eq(expected_date)
  end

  it 'should have headers' do
    @igc.headers.should be_a_kind_of Hash
  end

  it 'should have a pilot' do
    @igc.pilot.should eq('Maxi Müller')
  end

  it 'should have a flight path' do
    @igc.flight_path.should be_a_kind_of Hash
  end

  it 'should determine the duration of a flight' do
    @igc.flight_duration_in_seconds.should eq(200)
  end
end