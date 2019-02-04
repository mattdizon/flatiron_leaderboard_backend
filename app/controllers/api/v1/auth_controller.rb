class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create, :show]
	def create
		@user = User.find_by(username: user_login_params[:username])
		#User#authenticate comes from BCrypt
		if @user && @user.authenticate(user_login_params[:password])
			# encode token comes from ApplicationController
			token = encode_token({ user_id: @user.id })
			render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
		else
			render json: { message: 'Invalid username or password' }, status: :unauthorized
		end
	end

	def show
		string = request.authorization
		token = JWT.decode(string, 'l3arn_l0v3_c0d3')[0]
		id = token["user_id"].to_i
		@user = User.find(id)
		if @user
			render json: {user: {f_name: @user.f_name, l_name: @user.l_name, username: @user.username, email:@user.email, cohort_name: @user.cohort_name, avatar: @user.avatar}}
		else
			render json: {error: "User not found"}, status: 422
		end
	end
	private

	def user_login_params
		# params { user: {username: 'Chandler Bing', password: 'hi' } }
		params.require(:user).permit(:username, :password)
	end
end
