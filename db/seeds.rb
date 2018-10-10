# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
DatabaseCleaner.clean_with(:truncation)

admin_list = [
    [ "admin1@dm.com", "admin1_name", "admin1@dm.com", "(123) 456-7890" ],
    [ "admin@dm.com", "admin2_name", "GoPack2018", "(321) 654-1234"],
    [ "admin3@dm.com", "admin3_name", "admin3_password", "(456) 123-9876" ]
]

real_estate_companies_list = [
  ["We'll Sell Your Home!", "http://sellyohome.com", "1738 Home Seller Way", "23",
    "1992", "100000000", "We sell your house like you won't flippin' believe!"],
  ["Home Sellers Inc.", "http://homesellersinc.com", "1999 Realtation Dr", "100",
   "1893", "85736223", "Home Sellers Inc is the best. For real. Est. 1893."]
]

realtor_users_list = [
  ["user1@user.com", "Hot Dog", "123456", "(919) 867-5309"],
  ["user2@user.com", "Slim Shady", "123456", "(919) 123-4567"]
]

house_hunter_users_list = [
    ["user3@user.com", "Charlie Brown", "123456", "(420) 069-1738"],
    ["user4@user.com", "Amelia Earhart", "123456", "(911) 617-8765"]
]

rec_object_list = []
realtor_object_list = []

house_list = [
    ["12345 Home Way", "4000", "1927", "Single-Family", "250000", "2", "true", "Jack Bauer"],
    ["7777 Lucky Ct", "7777", "1777", "Mansion", "100000000", "5", "true", "Jay Gatsby"]
]

real_estate_companies_list.each do |name, website, address, size, founded, revenue, synopsis|
@real_estate_company = RealEstateCompany.create(name: name, website: website, address: address, size: size,
                                                founded: founded, revenue: revenue, synopsis: synopsis)
puts @real_estate_company.inspect
rec_object_list.push(@real_estate_company)
end


admin_list.each do |email, name, password, phone|
  @user = User.create( email: email, name: name, password: password, phone: phone, user_type: 1 )
  @admin = Admin.create( email: email, name: name, user_id: @user.id)
  puts @admin.inspect
end

count = 0
realtor_users_list.each do |email, name, password, phone|
  @user = User.create( email: email, name: name, password: password, phone: phone, user_type: 0 )
  @realtor = Realtor.create(real_estate_company_id: rec_object_list[count].id, user_id: @user.id)
  puts @user.inspect
  puts @realtor.inspect
  realtor_object_list.push(@realtor)
  count = count + 1
end

count = 0
house_hunter_users_list.each do |email, name, password, phone|
  @user = User.create( email: email, name: name, password: password, phone: phone, user_type: 0 )
  @house_hunter = HouseHunter.create( preferred_contact: "E-mail", user_id: @user.id )
  @interest_list = InterestList.create(house_hunter_id: @house_hunter.id)
  @house_hunter.interest_list = @interest_list
  puts @user.inspect
  puts @house_hunter.inspect
  count = count + 1
end

count = 0
house_list.each do |location, square_footage, year_built, style, list_price, num_of_floors, basement, current_owner|
  @house = House.create(location: location, square_footage: square_footage, year_built: year_built, style: style, list_price: list_price,
                        num_of_floors: num_of_floors, basement: basement, current_owner: current_owner,
                        realtor_contact: realtor_object_list[count].user.phone,
                        real_estate_company_id: realtor_object_list[count].real_estate_company_id,
                        realtor_id: realtor_object_list[count].id)
  puts @house.inspect
  count = count + 1

end