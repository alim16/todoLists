class Profile < ActiveRecord::Base
  belongs_to :user
 # validate :both_names_not_nill
 #validate :both_names_not_nill
 validates :first_name, presence: true, if: "last_name.nil?"
 validates :last_name, presence: true, if: "first_name.nil?"

 
 validates :gender, inclusion: { in: %w(male female),
    message: "%{value} is not in the list"}
#validates_with SueNotMale :fields => [:gender, :first_name]
validate :sue_not_male_name?
 
  
 scope :ordered_by_year, -> {order birth_year: :asc}
  
  def sue_not_male_name?
	  if ((gender == "male") && (first_name. == "Sue"))  then
		errors.add(:gender, "invalid name")
		end
		#return
  end
  
  def self.get_all_profiles(minYear, maxYear)
  profiles = Profile.ordered_by_year.where('birth_year >= ? AND birth_year <= ?', minYear, maxYear)  
  return profiles
  end
end

#class SueNotMale < ActiveModel::Validator
 # def validate(record)
	# if ((record.gender == "male") && (record.first_name== "Sue"))
     # record.errors[:base] << "invalid name for male"
    #end
 # end
#end


