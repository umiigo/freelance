5.times do
    user = User.create(
        full_name: Faker::Name.name,
        email: Faker::Internet.free_email,
        about: Faker::Quote.matz,
        password: '123456',
        from: Faker::Address.country,
        language: Faker::Nation.language,
        created_at: Date.today
    )

    user.avatar.attach(                
        io: image = open("https://i.pravatar.cc/300"),
        filename: "avatar#{user.id}.jpg", 
        content_type: 'image/jpg'
    )
end 