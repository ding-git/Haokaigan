class Note < ActiveRecord::Base
  belongs_to :chapter
  has_many :log, :dependent => :destroy
end
