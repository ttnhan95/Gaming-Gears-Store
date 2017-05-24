# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

User.create(name: 'admin',
            email: 'admin@gmail.com',
            password_digest: BCrypt::Password.create('123456'))

Category.delete_all
Category.create(title: 'mouse')
Category.create(title: 'headphone')
Category.create(title: 'keyboard')
Category.create(title: 'mousepad')

Product.delete_all
Product.create(name: 'Apex M500',
               description:
                   %{<p>
The Apex M500 is a tournament-grade backlit mechanical gaming keyboard built entirely around the needs of professional gamers, featuring Cherry MX Red switches and a sturdy no-frills design.
      </p>},
               manufacturer: 'Steelseries',
               image_url: 'https://media.steelseriescdn.com/thumbs/catalogue/products/00710-apex-m500/fc02865fcd854eac8914f7ce55e693e0.png.1000x575_q85_crop-smart.png',
               price: 100.00)
Product.create(name: 'Rival 100',
               description:
                   %{<p>
The Rival 100 optical gaming mouse brings unmatched performance to PC and Mac gaming, armed with illumination, a best in class sensor, and six programmable buttons at the best price.

With SteelSeries Engine, gamers can take full control over the Rival 100's performance. Customize and remap all 6 buttons, adjust the optical sensor's CPI, and customize the RGB illumination.
      </p>},
               manufacturer: 'Steelseries',
               image_url: 'https://media.steelseriescdn.com/filer_public/df/cb/dfcb0972-3648-4c6b-98e9-3288b45ea9fb/new-product-page-hero-gallery-rival__hero.png',
               price: 100.00)