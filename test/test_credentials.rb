class TestCredentials
  @aws_access_key_id = nil 
  @aws_secret_access_key = nil 
  @account_number = nil

  def self.aws_access_key_id
    @aws_access_key_id
  end

  def self.account_number
    @account_number
  end

  def self.aws_secret_access_key
    @aws_secret_access_key
  end

  def self.get_credentials
    # This file must set the class-ivars TODO yaml srsly
    return if aws_access_key_id
    require('.rightscale/testcredentials.rb')
  end
end
