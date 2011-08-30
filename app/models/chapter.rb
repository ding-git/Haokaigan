class Chapter < ActiveRecord::Base
  belongs_to :establish
  has_many   :note
  has_many   :tip
  has_many   :partner
end
