/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
	println(determineSeason(2, 2))
    println(determineLargest(1, 2, 3))
}

fun determineSeason(month: Int, day: Int): String {
    return when {
        3 <= month && month <= 5 -> "Spring"
        6 <= month && month <= 8 -> "Summer"
        9 <= month && month <= 11 -> "Autumn"
        else -> "Winter"
    } 

}

/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
	println(determineLargest(1, 7, 4))
}

fun determineLargest(num1: Int, num2: Int, num3: Int): Int {
    return if (num1 > num2){
        if (num1 > num3){
                num1
            } else {
                num3
            }   
        } else {
            if (num2 > num3){
                num2
            } else {
                num3
            }
        }    

}




