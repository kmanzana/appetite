# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Restaurant.destroy_all

restaurants = [
	{
		name: 'The Med',
		address: '1002 Walnut street',
		city: 'Boulder, CO',
		image_url: 'http://www.themedboulder.com/images/med-logo.png',
		dishes: [
			{
				name: 'Pomodori E Mozzarella',
				price: 10.95,
				image_url: 'http://s3-media3.ak.yelpcdn.com/bphoto/YLDNjOu7t31HBCjPsg4EMw/l.jpg'
			},
			{
				name: 'Bolognese',
				price: 11.95,
				image_url: 'http://www.dashrecipes.com/images/recipes/dr/d/dan-marino-pasta-bolognese_getty-images.jpg'
			},
			{
				name: 'Ravioli Raimondo',
				price: 16.95,
				image_url: 'http://2.bp.blogspot.com/_bv1UHtcZ51k/S8MOKrTe0eI/AAAAAAAABas/ednqOamOX1I/s1600/InVinoRav.jpg'
			},
			{
				name: 'Fazzoletti',
				price: 17.95,
				image_url: 'http://whatdidyoueat.typepad.com/photos/uncategorized/2008/01/17/img_1534.jpg'
			},
			{
				name: 'Pollo Parmigiana',
				price: 17.95,
				image_url: 'http://www.bonappetit.com/images/magazine/2008/09/mare_chicken_parmesan_h.jpg'
			}
		]
	}
	{
		name: "boulder cafe", 
		address: "2423 boxwood court", 
		city: "Boulder", 
		image_url: "http://media-cdn.tripadvisor.com/media/photo-s/01/1c/c1/5a/boulder-cafe.jpg",
		dishes: [
		]
	}
]



restaurants.each do |restaurant|
	r = Restaurant.new name: restaurant[:name], address: restaurant[:address], city: restaurant[:city]
	r.save

	restaurant[:dishes].each do |dish|
		d = Dish.new name: dish[:name], price: dish[:price], image_url: dish[:image_url], restaurant_id: r.id
		d.save
	end
end


puts "======================"
puts "created #{restaurants.length} restaurants"
puts "======================"






