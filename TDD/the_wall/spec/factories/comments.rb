FactoryGirl.define do
  factory :comment do
    message "This is a test comment that i'm making"
    post
    user
  end
end
