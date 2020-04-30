//https://leetcode.com/problems/find-permutation/
class Solution {
    func findPermutation(_ s: String) -> [Int] {
        let N = s.count
        let chars = [Character](s)
        var ans = Array<Int>(1...(N + 1))
        
        func reverse(_ start: Int, _ end: Int) {
            for i in 0..<((end - start) >> 1) {
                ans.swapAt(i + start, end - 1 - i)
            }
        }
        
        var i = 1
        while i <= N {
            let j = i
            while i <= N && chars[i - 1] == "D" {
                i += 1
            }
            reverse(j - 1, i)
            i += 1
        }
        return ans
    }
}
