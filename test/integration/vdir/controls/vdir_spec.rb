# encoding: utf-8
# copyright: 2017, Chef Software, Inc.
# license: All rights reserved

title 'iis_vdir section'

describe service('W3SVC') do
  it { should be_installed }
  it { should be_running }
  its ('startmode') { should eq 'Auto' }
end

describe iis_vdir('Default Web Site', '/vdir_test') do
  it { should exist }
  it { should have_path('/vdir_test') }
  it { should have_physical_path('C:\\inetpub\\wwwroot\\vdir_test') }
  it { should have_username('vagrant') }
  it { should have_password('vagrant') }
  it { should have_logon_method('ClearText') }
  it { should have_allow_sub_dir_config(false) }
end
