
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/order.rb'
require_relative './pages/components.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @order = OrderPage.new
    @popup = Popup.new
end

After do |scenario|

    # TIRAR PRINT APENAS DA FALHA DA EXECUÇÃO
    if (scenario.failed?)
        screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
        attach(screenshot, "image/png", "Screencshot")
    end

    # EVIDÊNCIAS PARA TODOS OS CENÁRIOS
    screenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
        attach(screenshot, "image/png", "Screencshot")
end