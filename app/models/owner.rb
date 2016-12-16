class Owner < ActiveRecord::Base
  # TODO: add validations
  validates :first_name, :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}, uniqueness: true, format: /.@./
  #before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    phone.gsub!(/^1/, '')
    phone.gsub!(/[()-.]/, '')
  end

end
