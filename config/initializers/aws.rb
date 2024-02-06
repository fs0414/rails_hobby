Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    'YOUR_ACCESS_KEY_ID',
    'YOUR_SECRET_ACCESS_KEY'
  )
})
