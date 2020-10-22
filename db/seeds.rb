require 'pry'
require 'rest-client' # let you actually make the requests to the URLs 
require 'json'
Snacker.destroy_all
Recipe.destroy_all
# FavoriteIngredient.destroy_all
FavoriteSnack.destroy_all

#





def get_snacks
    page_number = 1
    snack_array = []
    80.times do 
        all_snacks = RestClient.get("http://www.recipepuppy.com/api/?i=&q=&p=#{page_number}")
        snack_hash = JSON.parse(all_snacks)
        page_number += 1
        # binding.pry
        snack_array << snack_hash["results"]
    end
    snack_array = snack_array.flatten

    #binding.pry

    snack_array.each do |snack|
        #binding.pry
        Recipe.create(
        name: snack["title"],
        ingredients: snack["ingredients"],
        calories: rand(200..800)
        )
        #binding.pry
    end
end






binding.pry