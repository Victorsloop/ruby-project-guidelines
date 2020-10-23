class Snacker < ActiveRecord::Base
    has_many :favorite_snacks
    has_many :recipes, through: :favorite_snacks

    def add_favorite_snack(recipe)
        FavoriteSnack.create(snacker_id: self.id, recipe_id: recipe.id, name: recipe.name)
    end

    def delete_from_favorites(recipe)
        snack_to_delete = FavoriteSnack.where(recipe_id: recipe.id, snacker_id: self.id)
        FavoriteSnack.destroy(snack_to_delete)
    end
end