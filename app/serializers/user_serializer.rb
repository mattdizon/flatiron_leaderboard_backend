class UserSerializer < ActiveModel::Serializer
  attributes :username, :avatar, :f_name, :l_name, :email, :cohort_name
end
