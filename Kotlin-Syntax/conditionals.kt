/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun determineTriangle(side1: Double, side2: Double, side3: Double): String{
    return if (side1 == side2 && side1 == side3){
        "equilateral"
    } else if (side1 == side2 || side1 == side3 || side2 == side3){
        "isosceles"
    } else{
        "scalene"
    }
}
fun main() {
    println(determineTriangle(2.0, 2.0, 3.0))
    println(calculateSalary(hourlyPayRate = 40.0, hoursWorked = 10.0, overtime = 100.0))
}


fun calculateSalary(hoursWorked: Double, hourlyPayRate: Double, overtime: Double): Double{
    return hourlyPayRate * hoursWorked + overtime
}