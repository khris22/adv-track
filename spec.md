# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        <!-- User has many Adventures -->
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        <!-- Adventure belongs to a User & a Location -->
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        <!-- User has many locations through Adventures -->
        <!-- Locations has many Users through Adventures -->
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        <!-- Adventure has a name & recommendation field -->
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        <!-- Validated presence & uniqueness in User, Adventure & Location model -->
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        <!-- created 3 scope methods for Adventure. (is_wishlist, adventure_done & default scope for DESC order) -->
- [x] Include signup (how e.g. Devise) 
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        <!-- Created Login with Github -->
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        <!-- /locations/:id/adventures -->
        <!-- /locations/:id/adventures/:id -->
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        <!-- /locations/:id/adventures/new -->
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        <!-- Validation display on Sign Up & Log In, Adventure form & Location form -->

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
        <!-- Added helper methods for current_user and for options for list of states -->
- [x] Views use partials if appropriate
        <!-- Used form partials on views/adventures, views/locations, & layouts/error_messages -->
