class User
  include Sandra

  key_attribute :username, :string

  column :password_hash, :string

end
