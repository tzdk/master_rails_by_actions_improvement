# User
User.create!(email:  "admin@example.com", password: "112233", 
							password_confirmation: "112233", activation_state: "active",
							is_admin: "true")

# Category
category_1 = Category.create!(title:  "游戏", weight: "20", 
																	products_counter: "0", ancestry: nil)

category_first = Category.create!(title:  "RPG", weight: "10", 
																	products_counter: "0", ancestry: category_1.id)

category_2 = Category.create!(title:  "音乐", weight: "10", 
																	products_counter: "0", ancestry: nil)

category_first = Category.create!(title:  "民谣", weight: "10", 
																	products_counter: "0", ancestry: category_2.id)