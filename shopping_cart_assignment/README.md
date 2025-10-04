Why I used a class for ShoppingCart

I used a class for the shopping cart because it should be the same object everywhere.
If I pass the cart to a function and add an item, I want the original cart to change too.
This works because classes use reference semantics.
It makes sense for a cart, since the user always has one current cart.

Why I used structs for Product and Order

I used structs for products and orders because they are simple data models.
A product or an order should not change once it’s created.
Structs use value semantics, so they are copied instead of shared.
This keeps data safe and avoids unexpected changes.

Example of reference semantics

In the test, I call modifyCart(_:) and add a product inside it.
After the function ends, the main cart also has the new product.
This happens because both variables point to the same cart object.

Example of value semantics

I also tested copying a CartItem struct.
When I changed the quantity of the copy, the original did not change.
This shows that structs are stored by value, not by reference.

Challenges

I had small issues with optionals and mutating functions in structs.
I learned that reduce(into:) needs += to work correctly.
