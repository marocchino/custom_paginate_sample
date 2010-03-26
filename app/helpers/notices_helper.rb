module NoticesHelper
class NoticesLinkRenderer < WillPaginate::LinkRenderer

  # Process it! This method returns the complete HTML string which contains
  # pagination links. Feel free to subclass LinkRenderer and change this
  # method as you see fit.
  def to_html
    links = @options[:page_links] ? windowed_links : []
    # previous/next buttons
    links.unshift page_link_or_span(@collection.previous_page, '', @options[:previous_label])
    links.unshift page_link_or_span(1, '', @options[:last_label])
    links.push    page_link_or_span(@collection.next_page,     '', @options[:next_label])
    links.push    page_link_or_span(@collection.total_pages, '', @options[:first_label])
    links.push    page_span(@collection.total_pages, @options[:total_label].sub("##",@collection.total_pages.to_s))

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
  end
end
#
#=== 맵퍼
#
# Todo
#
def linker# {{{
  NoticesLinkRenderer.new
end# }}}
#require "#{RAILS_ROOT}/app/renderers/notices_link_renderer"
  
end
