  FactoryGirl.define do
      factory :user do
        name "Ivor Padilla"
        sequence(:email, 100) { |n| "person#{n}@example.com" }
        password "helloworld"
        password_confirmation "helloworld"
        confirmed_at Time.now

<<<<<<< Updated upstream

        factory :user_with_post_and_comment do
            ## placeholder
=======
        factory :user_with_post_and_comment do
          after(:build) do |user|
            post = create(:post, user: user)
            create(:comment, post: post, user: user)
          end
>>>>>>> Stashed changes
        end

      end



  end
