class Question < ActiveRecord::Base
    validates_uniqueness_of :id
    has_many :questions_access, dependent: :destroy
    default_scope { order(daily_access: :desc)}
end
