#
# Cookbook Name:: fourthcoffee
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'fourthcoffee::default' do
  context 'When installing via DSC, on windows 2012r2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2') do |node, server|
        node.set['fourthcoffee']['install_method'] = '_dsc'
       
        server.update_node(node)
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it "includes the iis::remove_default_site recipe" do
      expect(chef_run).to include_recipe('iis::remove_default_site')
    end
    
    # Alternative - not really a good unit test practice though!
    #it "Stops the default web site" do
    #  expect { chef_run }.to stop_iis_site('Default Web Site')
    #end

    #it "Deletes the default iis site" do
    #  expect { chef_run }.to delete_iis_site('Default Web Site')
    #end

    it 'Adds the iis pool' do
      expect(chef_run).to add_iis_pool('FourthCoffee')
    end

    it 'Starts the iis site' do
      expect(chef_run).to start_iis_site('FourthCoffee')
    end
  end
end
