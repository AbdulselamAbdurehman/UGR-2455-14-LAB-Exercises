fun sumEvenNumbers(): Int {
    var sum = 0
    for (i in 1..50) {
        if (i % 2 == 0) {
            sum += i
        }
    }
    return sum
}
fun findPrimeNumbers(start: Int, end: Int) {
    var num = start
    while (num <= end) {
        if (isPrime(num)) {
            println(num)
        }
        num++
    }
}

fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var i = 2
    while (i * i <= n) {
        if (n % i == 0) return false
        i++
    }
    return true
}



fun main() {
}
