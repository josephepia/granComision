FactoryBot.define do
  factory :user do
    password {"123123"}
    sequence(:email){|numero| "prueba_#{numero}@correo.com"}
  end
end
