# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 16 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: 'は小文字英数字で入力してください'
    }
  # 最低文字数を設定すると、空の時もエラーが返されるため、presenceを設定する必要がない
  validates :password,
    length: { minimum: 8 }
end
