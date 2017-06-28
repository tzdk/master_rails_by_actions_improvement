# User
User.create!(email:  "admin@example.com", password: "112233", 
							password_confirmation: "112233", activation_state: "active",
							is_admin: "true")
User.first.activate!

# Category
category_1 = Category.create!(title:  "电子类", weight: "20", 
																	products_counter: "0", ancestry: nil)

Category.create!(title:  "笔记本电脑", weight: "10", 
																	products_counter: "0", ancestry: category_1.id)

Category.create!(title:  "手机", weight: "10", 
																	products_counter: "0", ancestry: category_1.id)

Category.create!(title:  "电视", weight: "10", 
																	products_counter: "0", ancestry: category_1.id)

category_2 = Category.create!(title:  "书籍类", weight: "10", 
																	products_counter: "0", ancestry: nil)

Category.create!(title:  "历史", weight: "10", 
																	products_counter: "0", ancestry: category_2.id)

Category.create!(title:  "启蒙", weight: "10", 
																	products_counter: "0", ancestry: category_2.id)

Category.create!(title:  "小说", weight: "10", 
																	products_counter: "0", ancestry: category_2.id)

category_3 = Category.create!(title:  "服装类", weight: "10", 
																	products_counter: "0", ancestry: nil)

Category.create!(title:  "上衣", weight: "10", 
																	products_counter: "0", ancestry: category_3.id)

Category.create!(title:  "鞋子", weight: "10", 
																	products_counter: "0", ancestry: category_3.id)
