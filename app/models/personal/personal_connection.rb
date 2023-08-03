class PersonalConnection < ApplicationRecord
  belongs_to :source_person, class_name: 'Person'
  belongs_to :target_person
end
