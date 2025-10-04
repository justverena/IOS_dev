//
//  shopping_cart_assignmentTests.swift
//  shopping_cart_assignmentTests
//
//  Created by Verena Gaaze on 04.10.2025.
//

import Testing
@testable import shopping_cart_assignment
import Foundation
struct shopping_cart_assignmentTests {

    @Test func example() async throws {
        // 1. Create sample products
        let laptop = Product(id: "1", name: "Laptop", price: 1200, category: .electronics, description: "Powerful laptop")
        let book = Product(id: "2", name: "Swift Book", price: 40, category: .books, description: "Learn Swift")
        let headphones = Product(id: "3", name: "Headphones", price: 150, category: .electronics, description: "Noise cancelling")
        
        // 2. Test adding items to cart
        let cart = ShoppingCart(items: [], discountCode: "")
        cart.addItem(product: laptop, quantity: 1)
        cart.addItem(product: book, quantity: 2)
        
        // 3. Test adding same product twice (should update quantity)
        cart.addItem(product: laptop, quantity: 1)
        #expect(cart.itemCount == 4)
        
        // 4. Test cart calculations
        print("Subtotal: \(cart.subtotal)")
        print("Item count: \(cart.itemCount)")
        
        // 5. Test discount code
        cart.setDiscountCode("SAVE10")
        print("Total with discount: \(cart.total)")
        
        // 6. Test removing items
        cart.removeItem(productId: book.id)
        #expect(!cart.items.contains { $0.product.id == book.id })
        
        // 7. Demonstrate REFERENCE TYPE behavior
        func modifyCart(_ cart: ShoppingCart) {
            cart.addItem(product: headphones, quantity: 1)
        }
        modifyCart(cart)
        #expect(cart.items.contains { $0.product.id == headphones.id })
        
        // 8. Demonstrate VALUE TYPE behavior
        let item1 = CartItem(product: laptop, quantity: 1)
        var item2 = item1
        item2.updateQuantity(5)
        #expect(item1.quantity == 1)
        
        // 9. Create order from cart
        let address = Address(street: "Main St 1", city: "Berlin", zipCode: "12345", country: "Germany")
        let order = Order(from: cart, shippingAddress: address)
        
        // 10. Modify cart after order creation
        cart.clearCart()
        #expect(order.itemCount > 0)
        #expect(cart.itemCount == 0)
        
        // Bonus: User tests
        let user = User(userId: UUID().uuidString, name: "User", email: "user@gmail.com")
        user.placeOrder(order)
        #expect(user.orderHistory.count == 1)
        
        #expect(user.totalSpent == order.total)
        
        user.placeOrder(order)
        #expect(user.orderHistory.count == 2)
        #expect(user.totalSpent == order.total * 2)
        
    }
    
}
