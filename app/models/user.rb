class User
  include Sandra

  has_secure_password

  key_attribute :username, :string

  column :password_digest, :string

end
