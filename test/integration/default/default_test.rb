# InSpec test for recipe mysql_config::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

control 'mysql_database' do
  impact 1.0
  title 'test creation and removal of databases'
  sql = mysql_session('root', 'varun1234', '127.0.0.1', 3306)

  describe sql.query('show databases') do
    its(:stdout) { should match(/information_schema/) }
    its(:stdout) { should_not match(/performance_schemas/) }
  end
end