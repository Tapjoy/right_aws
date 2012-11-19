require 'minitest/unit'
$: << File.dirname(__FILE__)
require 'test_credentials'
TestCredentials.get_credentials

require 'awsbase/test_right_awsbase.rb'
require 'sqs/test_right_sqs.rb'
require 'sqs/test_right_sqs_gen2.rb'
require 'sdb/test_right_sdb.rb'
require 'acf/test_right_acf.rb'
require 'sns/test_right_sns.rb'
