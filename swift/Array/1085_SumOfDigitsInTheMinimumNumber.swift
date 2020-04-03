//https://leetcode.com/problems/sum-of-digits-in-the-minimum-number/
class Solution {
    func sumOfDigits(_ A: [Int]) -> Int {
        let minEle = A.min()!
        return (minEle % 10 + minEle / 10)  % 2 == 0 ? 1 : 0
    }
}
