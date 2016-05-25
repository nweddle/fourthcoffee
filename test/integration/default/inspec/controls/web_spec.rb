# encoding: utf-8
control 'webserver-install' do
  impact 1.0
  title 'Verify IIS service'
  desc 'Ensures IIS service is up and running'
  describe windows_feature('Web-Server') do
    it { should be_installed }
  end
end

control 'webserver-running' do
  impact 1.0
  title 'Port 80 open'
  desc 'Port 80 should be listening'
  describe port(80) do
    it { should be_listening }
  end
end

control 'webserver-files' do
  impact 1.0
  title 'Web content should be installed'
  desc 'Web content should be installed'
  describe file('C:\inetpub\FourthCoffee\Default.cshtml') do
    it { should be_file }
  end
end

control 'dotnet-install' do
  impact 1.0
  title 'Verify DotNet 45 installation'
  desc 'Ensures DotNet45 is installed'
  describe windows_feature('Web-Asp-Net45') do
    it { should be_installed }
  end  
end

control 'web-mgmt-console-install' do
  impact 1.0
  title 'Verify Web Management Console is installed'
  desc 'Ensures Web Management Console is installed'
  describe windows_feature('Web-Mgmt-Console') do
    it { should be_installed }
  end

end