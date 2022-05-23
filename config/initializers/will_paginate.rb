module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options[:renderer] ||= BootstrapLinkRenderer
      super.try :html_safe
    end

    class BootstrapLinkRenderer < LinkRenderer
      protected

      def html_container(html)
        tag(:nav, tag(:ul, html, class: 'pagination'), container_attributes)
      end

      def page_number(page)
        tag :li, link(page, page, rel: rel_value(page), class: 'page-link'), class: ['page-item', ('active' if page == current_page)].join(' ')
      end

      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || '#', class: 'page-link'), class: ['page-item', classname[0..3], classname, ('disabled' unless page)].join(' ')
      end

      def gap
        tag :li, link(super, '#'), class: 'disabled mx-1'
      end
    end
  end
end
