class User < ApplicationRecord
  validates :name, presence: true
  # validates :email, presence: true
  has_secure_password
  # パスワードの文字数を8~32文字のみ可能にしてください
  validates :password, length: { in: 8..32 }
#   パスワードをアルファベット、数字の混合のみ可能にしてください
# ・アルファベットだけ、数字だけのパスワードは不可とします
# ・少なくともアルファベットと数字はそれぞれ1文字以上含まないといけないようにします
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }
  # メールアドレスの正規表現を追加してください
  # /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/
#   名前の長さに制限を追加する
# ・15文字まで許可するようにValidationを設定してください。
# ※ 現状、nameカラムには空白以外制限がかかっていません。
# 　 string型の場合、データは255文字まで保存が可能ですが、255文字の名前を持っている人はいないでしょう。
  validates :name, length: { maximum: 15 }

  # urata
  #validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  # validates :password, length:{ in:8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
