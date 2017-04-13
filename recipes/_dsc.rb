#
# Cookbook Name:: fourthcoffee
# Recipe:: _dsc
#
# Copyright 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Use the 'dsc_resource' resource (requires WMF 5.0+)
#

dsc_resource 'webserver' do
  resource :windowsfeature
  property :name, 'Web-Server'
  property :ensure, 'Present'
end

dsc_resource 'dotnet45' do
  resource :windowsfeature
  property :name, 'Web-Asp-Net45'
  property :ensure, 'Present'
end

dsc_resource 'webmgmtconsole' do
  resource :windowsfeature
  property :name, 'Web-Mgmt-Console'
  property :ensure, 'Present'
end

#
# You can also use dsc_script (requires WMF 4.0+)
#

# dsc_script 'Web-Server' do
#   code <<-EOH
#   WindowsFeature InstallWebServer
#   {
#     Name = "Web-Server"
#     Ensure = "Present"
#   }
#   EOH
# end
#
# dsc_script 'Web-Asp-Net45' do
#   code <<-EOH
#   WindowsFeature InstallDotNet45
#   {
#     Name = "Web-Asp-Net45"
#     Ensure = "Present"
#   }
#   EOH
# end
#
# dsc_script 'Web-Mgmt-Console' do
#   code <<-EOH
#   WindowsFeature InstallIISConsole
#   {
#     Name = "Web-Mgmt-Console"
#     Ensure = "Present"
#   }
#   EOH
# end
