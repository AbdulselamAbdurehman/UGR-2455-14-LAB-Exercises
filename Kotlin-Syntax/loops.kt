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

fun isPalindrome(number: Int): Boolean {
    var original = number
    var reversed = 0
    while (original != 0) {
        val digit = original % 10
        reversed = reversed * 10 + digit
        original /= 10
    }
    return number == reversed
}


fun main(){
    val sumOfEvens = sumEvenNumbers()
    println("Sum of all even numbers from 1 to 50 is: $sumOfEvens")

    val startRange = 10
    val endRange = 50
    println("Prime numbers from $startRange to $endRange are:")
    findPrimeNumbers(startRange, endRange)

    val numberToCheck = 12321
    if (isPalindrome(numberToCheck)) {
        println("$numberToCheck is a palindrome")
    } else {
        println("$numberToCheck is not a palindrome")
    }

}