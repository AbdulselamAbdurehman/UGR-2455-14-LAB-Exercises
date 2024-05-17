fun main() {
    val array = arrayOf(1, 4, 3, 0)
    println(sortArray(array).contentToString())
    println(factorial(4))
}

fun sortArray(array: Array<Int>): Array<Int> {
    return array.sortedArray()
}


fun factorial(num: Int): Int{
    if (num == 1) return 1
    return num * factorial(num-1)
}

fun onlyUnique(string: String): Boolean{
    val charSet = mutableSetOf<Char>()
    for (char in input) {
        if (!charSet.add(char)) {
            return false
        }
    }
    return true
}