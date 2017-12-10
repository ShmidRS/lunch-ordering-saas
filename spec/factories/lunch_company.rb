FactoryGirl.define do
  factory :lunch_company do
    name { FFaker::Company }
    token { FFaker::DizzleIpsum.characters }
  end
end
