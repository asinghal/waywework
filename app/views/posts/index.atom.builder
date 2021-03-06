atom_feed(:url => atom_feed_url, :schema_date => 2005) do |feed|
  feed.title("WayWeWork")
  feed.updated(@posts.first.published)

  for post in @posts
    feed.entry(post, :url=>post.url_with_source_and_medium('rss'), :published=>post.published, :updated=>post.updated) do |entry|
      entry.title("#{post.feed.author}: #{post.title}")
      entry.content(post.contents, :type => 'html')
      entry.author do |author|
        author.name(post.feed.author)
      end
    end
  end
end
