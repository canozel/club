class Admin::MembersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_member, only: [:edit, :update, :destroy]
  before_action :ensure_admin

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create

  end

  def edit
    if @member.president
      @member.update_attribute :president, true
    else
      @member.update_attribute :president, false
    end
    update
  end



  def update
    redirect_to admin_member_path, notice: 'Kullanıcı başarıyla güncellendi!' if @member.update(member_params)
  end

  def destroy
    redirect_to admin_member_path, alert: 'Kullanıcı başarıyla silindi!' if @member.destroy
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:email, :first_name, :last_name, :password, :password_confirmation, :admin, :president)
  end

  def ensure_admin
    redirect_to :root, :alert => "Yetkisiz erişim sağlamaya çalışıyorsunuz!" unless current_member.admin
  end
end
