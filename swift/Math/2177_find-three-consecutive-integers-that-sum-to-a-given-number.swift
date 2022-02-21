// https://leetcode.com/problems/find-three-consecutive-integers-that-sum-to-a-given-number/
class Solution {
    func sumOfThree(_ num: Int) -> [Int] {
        guard num % 3 == 0 else {
            return []
        }
        let middle = num / 3
        return [middle - 1,middle,middle + 1]
    }
}