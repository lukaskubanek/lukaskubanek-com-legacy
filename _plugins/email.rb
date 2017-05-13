# Source: https://github.com/chauncey-garrett/jekyll-email-obfuscate/blob/master/email.rb

module Jekyll

  class EmailTag < Liquid::Tag

    MAIL_TO = '&#109;&#97;&#105;&#108;&#116;&#111;&#58;'
    STYLE = 'unicode-bidi: bidi-override; direction: rtl;'

    def initialize(tag_name, text, tokens)
      super
      @markup = text.strip
    end

    def render(context)
      email = "#{context[@markup.strip]}"
      
      reversed = encode(email.each_char.to_a.reverse.join)
      obfuscated = encode(email)
      
      "<script type=\"text/javascript\">" +
      " document.write('<a style=\"#{STYLE}\" href=\"#{MAIL_TO}#{obfuscated}\">#{reversed}</a>');" +
      "</script>"
    end

    private
    def encode(str)
      str = str.gsub('@', '&#64;')
      str = str.gsub('.', '&#46;')
    end
  end
end

Liquid::Template.register_tag('email', Jekyll::EmailTag)
