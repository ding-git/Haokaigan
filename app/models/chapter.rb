class Chapter < ActiveRecord::Base
  belongs_to :establish
  has_many   :note
end
