module ApplicationHelper
#  class CodeRayify < Redcarpet::Render::HTML
#  def block_code(code, language)
#    CodeRay.scan(code, language).div
#  end
#end
def markdown(text)
Kramdown::Document.new(text, {:input => 'GFM', :auto_ids => false, :html_to_native => true }).to_html.html_safe
end
end
