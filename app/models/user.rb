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

  enum birth_year:{
    "2020":0,"2019":1,"2018":2,"2017":3,"2016":4,"2015":5,"2014":6,"2013":7,"2012":8,"2011":9,"2010":10,
    "2009":11,"2008":12,"2007":13,"2006":14,"2005":15,"2004":16,"2003":17,"2002":18,"2001":19,"2000":20,
    "1999":21,"1998":22,"1997":23,"1996":24,"1995":25,"1994":26,"1993":27,"1992":28,"1991":29,"1990":30,
    "1989":31,"1988":32,"1987":33,"1986":34,"1985":35,"1984":36,"1983":37,"1982":38,"1981":39,"1980":40,
    "1979":41,"1978":42,"1977":43,"1976":44,"1975":45,"1974":46,"1973":47,"1972":48,"1971":49,"1970":50,
    "1969":51,"1968":52,"1967":53,"1966":54,"1965":55,"1964":56,"1963":57,"1962":58,"1961":59,"1960":60,
    "1959":61,"1958":62,"1957":63,"1956":64,"1955":65,"1954":66,"1953":67,"1952":68,"1951":69,"1950":70,
    "1949":71,"1948":72,"1947":73,"1946":74,"1945":75,"1944":76,"1943":77,"1942":78,"1941":79,"1940":80,
    "1939":81,"1938":82,"1937":83,"1936":84,"1935":85,"1934":86,"1933":87,"1932":88,"1931":89,"1930":90,
    "1929":91,"1928":92,"1927":93,"1926":94,"1925":95,"1924":96,"1923":97,"1922":98,"1921":99,"1920":100,
    "1919":101,"1918":102,"1917":103,"1916":104,"1915":105,"1914":106,"1913":107,"1912":108,"1911":109,"1910":110,
    "1909":111,"1908":112,"1907":113,"1906":114,"1905":115,"1904":116,"1903":117,"1902":118,"1901":119,"1900":120,
  },_suffix: true

  enum birth_month:{
    "1":0, "2":1, "3":2, "4":3, "5":4, "6":5, "7":6, "8":7, "9":8, "10":9, "11":10, "12":11,
  },_suffix: true

  enum birth_day:{
    "1":0, "2":1, "3":2, "4":3, "5":4, "6":5, "7":6, "8":7, "9":8, "10":9, "11":10, "12":11,
    "13":12, "14":13,"15":14, "16":15, "17":16, "18":17, "19":18, "20":19, "21":20, "22":21, 
    "23":22, "24":23, "25":24, "26":25, "27":26, "28":27, "29":28, "30":29, "31":30
  },_suffix: true
  
end