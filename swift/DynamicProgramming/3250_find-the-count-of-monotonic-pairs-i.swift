//https://leetcode.com/problems/find-the-count-of-monotonic-pairs-i/
class Solution {
    private let MOD = 1_000_000_007
    func countOfPairs(_ nums: [Int]) -> Int {
        let N = nums.count
        let P = nums.max()!
        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: N + 5), count: P + 5), count: P + 5)
        func dfs(_ arr1LastEle: Int, _ arr2LastEle: Int, _ curIdx: Int) -> Int {
            
            guard curIdx < N else {return 1}
            if let v = memo[arr1LastEle][arr2LastEle][curIdx] {
                return v
            }
            var sb = 0
            for first in 0...nums[curIdx] {
                let second = nums[curIdx] - first
                if first >= arr1LastEle && second <= arr2LastEle {
                    sb += dfs(first, second, curIdx + 1)
                    sb %= MOD
                }
            }
            memo[arr1LastEle][arr2LastEle][curIdx] = sb
            return sb
        }
        
        
        var sb = 0
        for i in 0...nums[0] {
            sb += dfs(i, nums[0] - i, 1)
            sb %= MOD
        }
        
        
        
        return sb
    }
}

