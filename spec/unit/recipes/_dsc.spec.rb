#
# Cookbook Name:: fourthcoffee
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'fourthcoffee::_dsc' do
  context 'When installing via DSC, on windows 2012r2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Installs IIS' do
      expect(chef_run).to add_iis_pool('FourthCoffee')
    end

    it 'Starts the iis site' do
      expect(chef_run).to start_iis_site('FourthCoffee')
    end
    
   
  end
end
