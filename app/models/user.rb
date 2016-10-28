class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_active?
    1==1
  end

  def is_worker?
    1==1
    # self.roles.include? 2
  end

  def add_log(notice,ip)

  end

  def student
    Student.find_by(email:self.email)
  end
end