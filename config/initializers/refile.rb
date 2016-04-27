if Rails.env.production?
  require "refile/s3"

  aws = {
    access_key_id: ENV["AWS_ACCESS_KEY"],
    secret_access_key: ENV["AWS_SECRET_KEY"],
    region: "us-east-1",
    bucket: "recipebook-app",
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
end
