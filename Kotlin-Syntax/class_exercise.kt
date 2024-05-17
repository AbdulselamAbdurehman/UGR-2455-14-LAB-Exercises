class Rectangle(private val length: Double, private val width: Double) {

    fun perimeter(): Double {
        return 2 * (length + width)
    }

    fun area(): Double {
        return length * width
    }
}

fun main() {
    val rectangle = Rectangle(5.0, 3.0)
    println("Rectangle Perimeter: ${rectangle.perimeter()}")
    println("Rectangle Area: ${rectangle.area()}")
    
    val triangle = Triangle(5.0, 5.0, 5.0)
    println(triangle.determineTriangle())

    val cart = ShoppingCart()
    cart.addItem("Apple", 0.99)
    cart.addItem("Banana", 1.49)
    cart.addItem("Orange", 1.29)
    cart.displayItems()
    println("Total price: $${cart.totalPrice()}")

    cart.removeItem("Banana")
    cart.displayItems()
    println("Total price after removing Banana: $${cart.totalPrice()}")

}



class Triangle(private val side1: Double, private val side2: Double, private val side3: Double) {

    fun determineTriangle(): String{
       return if (side1 == side2 && side1 == side3){
                "equilateral"
            } else if (side1 == side2 || side1 == side3 || side2 == side3){
                "isosceles"
            } else{
                "scalene"
            }
        }
}

class ShoppingCart {
    private val items = mutableListOf<Pair<String, Double>>()

    fun addItem(name: String, price: Double) {
        items.add(Pair(name, price))
    }

    fun removeItem(name: String): Boolean {
        val iterator = items.iterator()
        while (iterator.hasNext()) {
            val item = iterator.next()
            if (item.first == name) {
                iterator.remove()
                return true
            }
        }
        return false
    }

    fun totalPrice(): Double {
        var total = 0.0
        for (item in items) {
            total += item.second
        }
        return total
    }

    fun displayItems() {
        println("Items in the shopping cart:")
        for (item in items) {
            println("${item.first}: $${item.second}")
        }
    }
}


