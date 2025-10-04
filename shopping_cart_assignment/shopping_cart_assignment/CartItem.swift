struct CartItem {
    let product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0{
            quantity = newQuantity
        }
    }
    
    mutating func increaseQuantity(by amount: Int) {
        return updateQuantity(quantity + amount)
    }
}
