//https://leetcode.com/problems/finding-3-digit-even-numbers/
class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var ans = Set<Int>()
        let N = digits.count
        for first in 0..<N {
            guard digits[first] > 0 else { continue}
            for second in 0..<N {
                guard second != first else {continue}
                for third in 0..<N {
                    guard third != second && third != first && digits[third] & 1 == 0 else {continue}
                    ans.insert(100 * digits[first] + 10 * digits[second] + digits[third])
                }
            }
        }
        return ans.sorted()
    }
}
