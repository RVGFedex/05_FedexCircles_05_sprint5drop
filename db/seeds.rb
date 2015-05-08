# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c0 = Circle.create({name: "Empty Circle", group_code: "Empty", points: 0})
c1 = Circle.create({name: "Aviva Staff", group_code: "Aviva", points: 0})

prod0 = Product.create({name:"Promo", spweight:0, rpweight:0})
prod1 = Product.create({name:"Motor", spweight:50, rpweight:1.25})
prod2 = Product.create({name:"Home", spweight:1.1, rpweight:1})
prod3 = Product.create({name:"Health", spweight:100, rpweight:0.75})
prod4 = Product.create({name:"Pension", spweight:250, rpweight:3.0})
prod5 = Product.create({name:"Life Assurance", spweight:1, rpweight:0.5})
prod6 = Product.create({name:"Travel", spweight:1.1, rpweight:0.4})

role1 = Role.create({name: "BackOfficeMgr", description: "Can perform any CRUD operation on any resource"})
role2 = Role.create({name: "BackOfficeUser", description: "Can read and create items. Can update and destroy own items"})
role3 = Role.create({name: "Customer", description: "Can read items"})

dummyUser = User.create({name: "Dummy Dummy", email: "dummy@dummy.com", password: "password", password_confirmation: "password", role_id: role1.id, circle_id: c1.id})
mgr1 = User.create({name: "John Murphy", email: "john@aviva.ie", password: "password", password_confirmation: "password", role_id: role1.id, circle_id: c1.id})
mgr2 = User.create({name: "Kim Deal", email: "kim@aviva.ie", password: "password", password_confirmation: "password", role_id: role2.id, circle_id: c1.id})

cust1 = User.create({name: "Gary Twigg", email: "gary@example.ie", password: "password", password_confirmation: "password", role_id: role3.id})
cust2 = User.create({name: "Dessie Baker", email: "dessie@example.ie", password: "password", password_confirmation: "password", role_id: role3.id})
cust3 = User.create({name: "Graham Barrett", email: "graham@example.ie", password: "password", password_confirmation: "password", role_id: role3.id})

pol1 = Policy.create({product_id: prod0.id, user_id: dummyUser.id})

mc = Circle.create({name: "Murphy Family", group_code: "MURP1234", points: 0})
User.create({name: "Mammy Murphy", email: "mam@murphy.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:mc.id})
User.create({name: "Daddy Murphy", email: "dad@murphy.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:mc.id})
User.create({name: "Granny Murphy", email: "gran@murphy.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:mc.id})
User.create({name: "Auntie Murphy", email: "auntie@murphy.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:mc.id})

User.create({name: "John Jr Murphy", email: "son@murphy.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:c0.id})

fc = Circle.create({name: "Team Trim Celtic", group_code: "TRIM5678", points: 0})
User.create({name: "Mark Keeper", email: "mark01@trimfc.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:fc.id})
User.create({name: "John Defender", email: "john04@trimfc.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:fc.id})
User.create({name: "Paul Forward", email: "paul10@trimfc.ie", password: "password", password_confirmation: "password", role_id: role3.id, circle_id:fc.id})

#r1 = Reward.create({ product_id: prod6.id, offer_type:"Discount", min_circle_size:3, min_circle_points:1000, title:"Travel Insurance 10% Discount",points_cost:100, discount:10, desc1:"Blah blah", desc2:"Blurb blurb"})
#r2 = Reward.create({ product_id: prod6.id, offer_type:"Discount", min_circle_size:5, min_circle_points:2000, title:"Travel Insurance 25% Discount",points_cost:200, discount:25, desc1:"Blah blah", desc2:"Blurb blurb"})
#r3 = Reward.create({ product_id: prod0.id, offer_type:"Promo", min_circle_size:0, min_circle_points:200, title:"Aviva Stadium Tour",points_cost:100, desc1:"Blah blah", desc2:"Blurb blurb"})
#r4 = Reward.create({ product_id: prod0.id, offer_type:"Promo", min_circle_size:2, min_circle_points:1500, title:"Driving Lessons Coupons",points_cost:700, desc1:"Blah blah", desc2:"Blurb blurb"})

r1 = Reward.create({ product_id: prod6.id, offer_type:"Discount", min_circle_size:3, min_circle_points:100, title:"Travel Insurance 10% Discount",points_cost:100, discount:10, desc1:"Blah blah", desc2:"Blurb blurb"})
r2 = Reward.create({ product_id: prod6.id, offer_type:"Discount", min_circle_size:5, min_circle_points:2500, title:"Travel Insurance 25% Discount",points_cost:250, discount:25, desc1:"Blah blah", desc2:"Blurb blurb"})
r3 = Reward.create({ product_id: prod0.id, offer_type:"Promo", min_circle_size:0, min_circle_points:200, title:"Aviva Stadium Tour",points_cost:200, desc1:"Blah blah", desc2:"Blurb blurb"})
r4 = Reward.create({ product_id: prod0.id, offer_type:"Promo", min_circle_size:2, min_circle_points:2000, title:"15% Off Driving Lessons Coupons",points_cost:2000, desc1:"Blah blah", desc2:"Blurb blurb"})
r5 = Reward.create({ product_id: prod0.id, offer_type:"Promo", min_circle_size:5, min_circle_points:5000, title:"Priority Tickets",points_cost:0, desc1:"Blah blah", desc2:"Blurb blurb"})


