struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    
    enum Category: String, CaseIterable {
        case electronics
        case clothing
        case food
        case books
    }
    
    init(id: String, name: String, price: Double, category: Category, description: String) {
        self.id = id
        self.name = name
        self.price = max(price, 0.01)
        self.category = category
        self.description = description
    }
    
    var displayPrice: String {
        return String(format:"$%.2f", price)
    }
}
