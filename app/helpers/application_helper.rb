module ApplicationHelper
  def page_title
    title = "食べログ"
    title = @page_title + "[#{title}]" if @page_title
    title
  end
end
