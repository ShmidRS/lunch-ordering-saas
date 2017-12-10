module DeviseSpecHelpers

  include Warden::Test::Helpers

  def sign_in(options = {})
    options.reverse_merge! is_admin: false

    user =
      if options[:user].present?
        options[:user]
      else
        create_user(options[:is_admin])
      end

    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end

  private

  def create_user(is_admin)
    user = User.create(email: 'shmid@shmid.com', password: '12345678')
    user.update(admin: is_admin)
    user
  end
end