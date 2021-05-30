// https://leetcode.com/problems/minimum-xor-sum-of-two-arrays/
class Solution {
    func minimumXORSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        
        let N = nums1.count
        var memo = [Int:Int]()
        
        func dfs(_ idx: Int, _ visited: Int) -> Int {
            guard idx < N else {
                return 0
            }
            let key = idx << 32 | visited
            if let  v = memo[key]  {
                return v
            }
            var ans = Int.max
            for bit in 0..<N {
                if visited & (1 << bit) == 0 {
                    ans = min(ans, dfs(idx + 1, visited | (1 << bit)) + (nums1[idx] ^ nums2[bit]))
                }
            }
            memo[key] = ans
            return ans
        }
        
        return dfs(0, 0)
    }
}

