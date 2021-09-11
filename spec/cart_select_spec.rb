describe "add to cart", :add do
    before(:each) do
      page.current_window.resize_to(1280, 800)
    end

            
    it "random item", :sample do
        visit "http://automationpractice.com/index.php?id_product=2&controller=product"
        drop = find(".selector")
        drop.all("option").sample.select_option
        page.find("#color_8").click
        page.find("#add_to_cart").click
        expect(find("#layer_cart")).to have_content "Product successfully added to your shopping cart"
        page.save_screenshot('logs/pre_cart.png')
        expect(find("#layer_cart_product_attributes")).to have_content "White"
        expect(find("#layer_cart_product_price")).to have_content "$27.00"
        click_on(class: 'btn btn-default button button-medium')
        expect(find("#summary_products_quantity")).to have_content "1 Product"
        page.save_screenshot('logs/cart.png')
        
        
      end

end
