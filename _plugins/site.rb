module Jekyll
  class Site

    def get_talks
      t = self.pages.select {|post| post.data['categories']}
      t = t.select {|post| post.data['categories'].include?("talks") }
      t.sort {|x,y| x.data['date'] <=> y.data['date']}.reverse
    end

    alias super_site_payload site_payload
    def site_payload
      h = super_site_payload
      payload = h["site"]
      payload["talks"] = get_talks
      h["site"] = payload
      h
    end
  end
end
