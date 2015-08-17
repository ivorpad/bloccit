  FactoryGirl.define do
      factory :user do
        name "Ivor Padilla"
        sequence(:email, 100) { |n| "person#{n}@example.com" }
        password "helloworld"
        password_confirmation "helloworld"
        confirmed_at Time.now


        factory :user_with_post_and_comment do
            ## placeholder
        end

      end
  end
