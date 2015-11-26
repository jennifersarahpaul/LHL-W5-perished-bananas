User.create(
  email:              "jennifertigner@gmail.com", 
  password_digest:    "jennifer", 
  firstname:          "Jennifer", 
  lastname:           "Tigner", 
  admin:              true
)

22.times do
  User.create(
    email:            FFaker::Internet.email,
    password_digest:  FFaker::Internet.password,
    firstname:        FFaker::Name.first_name,
    lastname:         FFaker::Name.last_name
    )
end

