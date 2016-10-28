class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_active?
    self.status.to_i == 1
  end

  def is_worker?
    self.role_id.to_i == 2
  end

  def is_student?
    self.role_id.to_i != 2
  end

  def add_log(notice,ip)

  end

  def student
    Student.find_by(email:self.email)
  end
  
end