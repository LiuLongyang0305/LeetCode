//https://leetcode.com/contest/weekly-contest-145/problems/longest-well-performing-interval/
class Solution {
    func longestWPI(_ hours: [Int]) -> Int {
        var ans = 0
        let size  = hours.count
        let hoursCopy = hours.map { (val) -> Int in
            val > 8 ? 1 : -1
        }
        
        var sum = Array<Int>(repeating: 0, count: size + 1)
        for i in 0..<size {
            sum[i + 1] = sum[i] + hoursCopy[i]
        }
        for i in 0..<size {
            var j = size
            while j > i && j - i > ans  {
                if  sum[i] < sum[j] {
                    ans = j - i
                }
                j -= 1
            }
        }
        return ans
    }
}
