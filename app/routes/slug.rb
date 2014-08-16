get '/:slug' do |slug|
  link = Link.find_by(slug: slug)

  pass if link.nil?

  link.inc(count: 1)

  redirect link.url
end

delete '/:slug' do |slug|
  link = Link.find_by(slug: slug)

  link.destroy if link

  redirect to('/')
end
