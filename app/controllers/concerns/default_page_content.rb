module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "3JMCoding | Web/Games Profolio"
    @seo_keywords = "3JMCoding portfolio"
  end
end
