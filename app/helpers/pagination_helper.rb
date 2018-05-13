module PaginationHelper
  def custom_paginator(resource)
    will_paginate resource, renderer: WillPaginate::ActionView::Bootstrap4LinkRenderer, class: 'pagination-sm'
  end
end