class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :email, uniqueness: {case_sensitive: false}
    has_many :rejections


#    def as_json(options={})
#      super(
#            :include => {
#              :rejections => {:only => [:rejection_url]}
#            }
#      )
#    end


end
