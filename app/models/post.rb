class Post < ActiveRecord::Base
  attr_accessible :author, :content, :destination, :discipline, :project, :subject, :tag, :tags_attributes

  validates :project,  :presence => true,
                    :length => { :minimum => 3 }
  validates :author,  :presence => true,
                    :length => { :minimum => 3 }
  validates :destination,  :presence => true,
                    :length => { :minimum => 3 }
  validates :discipline,  :presence => true,
                    :length => { :minimum => 3 }
  validates :tag,  :presence => true,
                    :length => { :minimum => 24 } 
  validates :subject,  :presence => true,
                    :length => { :minimum => 5 }
  validates :content, :presence => true,
                    :length => { :minimum => 10 }

  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
