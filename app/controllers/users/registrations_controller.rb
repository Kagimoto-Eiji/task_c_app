class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    redirect_to root_path, notice: 'ゲストユーザーの編集・削除できません。' if resource.email == 'guest@example.com'
  end
end
