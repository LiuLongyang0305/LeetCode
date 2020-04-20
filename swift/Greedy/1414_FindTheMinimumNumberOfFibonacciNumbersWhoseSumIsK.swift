//  https://leetcode.com/problems/find-the-minimum-number-of-fibonacci-numbers-whose-sum-is-k/
class Solution {
    private let fibonacciNumbers = [1134903170, 701408733, 433494437, 267914296, 165580141, 102334155, 63245986, 39088169, 24157817, 14930352, 9227465, 5702887, 3524578, 2178309, 1346269, 832040, 514229, 317811, 196418, 121393, 75025, 46368, 28657, 17711, 10946, 6765, 4181, 2584, 1597, 987, 610, 377, 233, 144, 89, 55, 34, 21, 13, 8, 5, 3, 2, 1, 1]
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var ans = 0
        var target = k
        for i in 0..<45{
            if target >= fibonacciNumbers[i] {
                target -= fibonacciNumbers[i]
                ans += 1
            }
        }
        return ans
    }
}