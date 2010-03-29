module NoticesHelper
  class NoticesLinkRenderer < WillPaginate::LinkRenderer

    # Process it! This method returns the complete HTML string which contains
    # pagination links. Feel free to subclass LinkRenderer and change this
    # method as you see fit.
    def to_html
      links = @options[:page_links] ? windowed_links : []
      # previous/next buttons
      links.unshift page_link_or_span(@collection.previous_page, '', @options[:previous_label])
      links.unshift page_link_or_span(prev100_page, '', @options[:prev100_label])
      links.unshift page_link_or_span(1, '', @options[:last_label])
      links.push    page_link_or_span(@collection.next_page,     '', @options[:next_label])
      links.push    page_link_or_span(next100_page,     '', @options[:next100_label])
      links.push    page_link_or_span(@collection.total_pages, '', @options[:first_label])
      links.push    page_span(@collection.total_pages, @options[:total_label].sub("##",@collection.total_pages.to_s))

      html = links.join(@options[:separator])
      @options[:container] ? @template.content_tag(:div, html, html_attributes) : html
    end
    def visible_page_numbers
      inner_window, outer_window = @options[:inner_window].to_i, @options[:outer_window].to_i
      window_from = (current_page-inner_window/2)
      window_to = (current_page+inner_window/2-1)

      # adjust lower or upper limit if other is out of bounds
      if window_to > total_pages
        window_from -= window_to - total_pages
        window_to = total_pages
      end
      if window_from < 1
        window_to += 1 - window_from
        window_from = 1
        window_to = total_pages if window_to > total_pages
      end

      visible   = (1..total_pages).to_a
      left_gap  = 1...window_from
      right_gap = (window_to + 1)..total_pages
      visible  -= left_gap.to_a  
      visible  -= right_gap.to_a 

      visible
    end

    def prev100_page
      return current_page - 100 if current_page > 100
      1
    end
    def next100_page
      return current_page + 100 if current_page + 100 < total_pages
      total_pages
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
