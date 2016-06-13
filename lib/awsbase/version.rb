module RightAws #:nodoc:
  module VERSION #:nodoc:
    MAJOR = 3  unless defined?(MAJOR)
    MINOR = 0  unless defined?(MINOR)
    TINY  = 3  unless defined?(TINY)
    TAPJOY_VERSION  = 2  unless defined?(TAPJOY_VERSION)

    STRING = [MAJOR, MINOR, TINY, TAPJOY_VERSION].join('.') unless defined?(STRING)
  end
end
