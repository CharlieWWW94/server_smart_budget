FactoryBot.define do
    factory :user, class: "User" do
        username {Faker::Name.unique.name}
        email {Faker::Internet.email}
        pw_hash {Faker::Internet.password}
        city {Faker::Address.city}
        country {Faker::Address.country}
    end
end
