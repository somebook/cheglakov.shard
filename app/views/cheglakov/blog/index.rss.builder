xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title t("front.cheglakov.aleksandr_cheglakov")
    xml.description t("front.cheglakov.description")
    xml.link root_path(format: :rss)
    
    for post in @posts
      xml.item do
        xml.title post.content(@current_shard_language).title
        xml.body post.content(@current_shard_language).body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link blog_path(post, :rss)
        xml.guid blog_path(post, :rss)
      end
    end
  end
end