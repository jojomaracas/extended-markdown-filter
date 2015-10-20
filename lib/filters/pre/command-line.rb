module Filters
  module PreFilter
    def format_command_line(text)
      text.gsub /\n?``` command-line(.+?)```/m do |block|
        block.gsub! /^``` command-line/, '<pre class="command-line">'
        block.gsub! /^```$/, "</pre>\n"
        block.gsub!(/^\$ (.+)$/) { %Q|<span class="command">#{$1.rstrip}</span>| }
        block.gsub!(/^(\# .+)$/) { %Q|<span class="comment">#{$1.rstrip}</span>| }
        block.gsub!(/^> (.+)$/) { %Q|<span class="output"><span># </span>#{$1.rstrip}</span>| }

        block
      end
    end
  end
end
