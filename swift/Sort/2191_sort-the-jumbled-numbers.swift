//https://leetcode.com/problems/sort-the-jumbled-numbers/
class Solution {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        
        func  caculate(_ num: Int) -> Int {
            guard num > 0 else {
                return mapping[num]
            }
            var ans = 0
            
            var t = num
            var base = 1
            
            while t > 0 {
                ans = mapping[t % 10] * base + ans
                t /= 10
                base *= 10
            }
            
            return ans
        }
        let M = nums.count
        let newNumbers = nums.map {caculate($0)}
        return (0..<M).sorted { newNumbers[$0] < newNumbers[$1]}.map { nums[$0]}
    }
}