class Store
  def call(env)
    x = Builder::XmlMarkup.new :indent=>2

    x.declare! :DOCTYPE, :html
    x.html do
      x.head do
        x.title 'Gaming Gear Store'
      end
      x.body do
        x.h1 'Gaming Gear Store'

        Product.all.each do |product|
          x.h2 product.name
          x << "      #{product.description}\n"
          x.p product.price
        end
      end
    end

    response = Rack::Response.new(x.target!)
    response['Content-Type'] = 'text/html'
    response.finish
  end
end