class Link
  include Sandra

  ALNUM = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).flatten
  ALNUM_SIZE = ALNUM.size

  key_attribute :code, :string

  column :url, :string

  before_save :remove_http_from_url
  before_create :generate_code

  def to_param
    code
  end

  private

  def remove_http_from_url
    self.url = self.url.sub(/^http(s|):\/\//, "")
  end

  def generate_code
    self.code = (1..6).map{|i| ALNUM[rand(ALNUM_SIZE)]}.join
    if Link.get(self.code)
      self.generate_code
    end
  end
end
