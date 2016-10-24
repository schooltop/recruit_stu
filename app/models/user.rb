class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_active?
    1==1
  end

  def add_log(notice,ip)

  end
end