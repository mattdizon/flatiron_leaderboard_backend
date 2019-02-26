class Rejection < ApplicationRecord
  belongs_to :user
  def as_json(options={})
       super(
             :include => {
               :user => {:only => [:username]}
             }
       )
     end
end
