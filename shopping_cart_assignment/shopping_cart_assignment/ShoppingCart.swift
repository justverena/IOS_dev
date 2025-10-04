class ShoppingCart {
    private(set) var items: [CartItem]
    private(set) var discountCode: String
    
    init(items: [CartItem], discountCode: String) {
        self.items = items
        self.discountCode = discountCode
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
                   items[index].quantity += quantity
               } else {
                   let newItem = CartItem(product: product, quantity: quantity)
                   items.append(newItem)
               }
           }
    
    func removeItem(productId: String) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items.remove(at: index)
        }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        if quantity <= 0 {
            removeItem(productId: productId)
            return
        }
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items[index].updateQuantity(quantity)
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        items.reduce(0) { $0 + $1.subtotal }
    }
    
    var discountAmount: Double {
        switch discountCode.uppercased() {
        case "SAVE10":
            return subtotal * 0.10
        case "SAVE20":
            return subtotal * 0.20
        default:
            return 0
        }
    }
    
    var total: Double {
        subtotal - discountAmount
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
        // TODO: Computed property for item count
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
    
    func getDicountCode() -> String {
        return discountCode
    }
    
    func setDiscountCode(_ discountCode: String){
        self.discountCode = discountCode
    }
}
