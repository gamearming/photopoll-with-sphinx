class Photo < ActiveRecord::Base
  has_attached_file :body
  has_many :ratings
  define_index do
    indexes :name, :sortable => true
  end
end
