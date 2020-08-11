class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true, uniqueness: true
  # validates :encrypted_password,
  KANJI_ZENKAKU = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, presence: true
  validates :first_name, presence: true, format: {with: KANJI_ZENKAKU,message: :invalid_zenkaku}, allow_blank: true
  validates :last_name, presence: true
  validates :last_name, presence: true, format: {with: KANJI_ZENKAKU,message: :invalid_zenkaku}, allow_blank: true
  KANA_ZENKAKU = /\A[ァ-ヶー－]+\z/
  validates :first_name_kana, presence: true
  validates :first_name_kana, presence: true, format: {with: KANA_ZENKAKU,message: :invalid_zenkaku}, allow_blank: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, presence: true, format: {with: KANA_ZENKAKU,message: :invalid_zenkaku}, allow_blank: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end