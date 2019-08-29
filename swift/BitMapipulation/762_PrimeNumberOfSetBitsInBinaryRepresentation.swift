//https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/
let primers: Set<Int> = [2,3,5,7,11,13,17,19,23,29,31]
class Solution {
    
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        var counter = 0
        for i in L...R {
            if primers.contains(getNumbersOfOnes(num: i)) {
                counter += 1
            }
        }
        return counter
    }
    
    private  func getNumbersOfOnes(num: Int) -> Int {
        var count = 0
        var temp = num
        while temp > 0 {
            count += 1
            temp &= (temp - 1)
        }
        return count
    }
}