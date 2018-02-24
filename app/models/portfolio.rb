class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destory: true,
                                reject_if: lambda {|attrs| attrs['name'].blank?}
  
  include Placeholder
    validates_presence_of :title, :body

    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    
    def self.python
        where(subtitle: 'Python')
    end
    
    def self.rails
        where(subtitle: 'Ruby on Rails')
    end

    def self.by_position 
      order("position ASC")
    end
    
end
