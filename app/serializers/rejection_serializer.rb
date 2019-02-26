class RejectionSerializer < ActiveModel::Serializer
  attributes :id , :company,:stage_of_rejection,:rejection_url
  belongs_to :user
end
