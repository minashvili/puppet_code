porttest::tcp { 'test tcp 80 to google.com':
  target => 'google.com',
  port   => '80',
}

#
# Not on by default test because UDP response is application 
# defined and most don't offer a response to verify so we
# really never know.
#
# porttest::udp { 'test udp to google DNS':
#   target => '8.8.8.8',
#   port   => '53',
# }
