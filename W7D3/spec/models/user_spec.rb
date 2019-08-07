# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    User.create!(
      username: "bob",
      password: "123456"
    )
  end

  describe "encryption" do
    it "does not save plaintext passwords to db" do
      User.create!(username: "justin", password: "abcdefgh")
      user = User.find_by(username: "justin")
      expect(user.password).not_to be ("abcdefgh")
    end

    it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: 'justin', password: "abcdefgh")
    end
  end

  it { should validate_presence_of(:username)}
  it { should validate_uniqueness_of(:username)}

end
