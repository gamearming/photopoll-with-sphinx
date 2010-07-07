class Photo < ActiveRecord::Base
  has_attached_file :body
  has_many :ratings
  define_index do
    indexes :name
    has :created_at
    indexes ratings(:comment), :as => :comments
  end
end
