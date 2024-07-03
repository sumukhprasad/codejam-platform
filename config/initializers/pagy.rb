Pagy::DEFAULT[:items] = 50 # items per page
Pagy::DEFAULT[:size]  = 3  # nav bar links

require 'pagy/extras/overflow'
require "pagy/extras/array"

Pagy::DEFAULT[:overflow] = :last_page