class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  default_scope -> { order(id: 'desc')}
end
