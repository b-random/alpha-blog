module ApplicationHelper
  def gravatar_for(user, options = {size: 80}) #parameter 2 is the default size.  Override inline on user show page
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
    #this method can be found in Gravatar docs and is specific to Gravatar
  end
end
