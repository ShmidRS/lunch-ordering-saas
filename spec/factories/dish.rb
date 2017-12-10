FactoryGirl.define do
  factory :dish do
    name { FFaker::Food.meat }
    price { Random.rand(100..200) }
  end
end
