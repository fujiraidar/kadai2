class Book < ApplicationRecord
	validate :add_error_sample


  def add_error_sample
    if title.empty?&&body.empty?

  		errors.add(:title,"can't be blank")
  		errors.add(:body,"can't be blank")
  	elsif title.empty?
  	    errors.add(:title,"can't be blank")
    elsif body.empty?
    	errors.add(:body,"can't be blank")
    else

    end
  end
end
