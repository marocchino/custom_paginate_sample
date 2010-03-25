class NoticesLinkRenderer < WillPaginate::LinkRenderer

  # Process it! This method returns the complete HTML string which contains
  # pagination links. Feel free to subclass LinkRenderer and change this
  # method as you see fit.
  def to_html
    links = @options[:page_links] ? windowed_links : []
    # previous/next buttons
    links.unshift page_link_or_span(@collection.previous_page, 'disabled prev_page', @options[:previous_label])
    links.unshift page_link_or_span(1, '', "First")
    links.push    page_link_or_span(@collection.next_page,     'disabled next_page', @options[:next_label])
    links.push    page_link_or_span(@collection.total_pages, '', "Last")
    links.push    page_span(@collection.total_pages, "total #{@collection.total_pages} pages")

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
  end
end

