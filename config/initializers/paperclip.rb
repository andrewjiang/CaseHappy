Paperclip::Attachment.default_options.merge!(
    url: ':s3_domain_url',
    path: ':class/:attachment/:id/:style/:filename',
    storage: :s3,
    s3_credentials: {
        :bucket => ENV['S3_BUCKET_NAME'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    s3_permissions: :private,
    s3_protocol: 'https'
)