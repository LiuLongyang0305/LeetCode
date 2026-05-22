//https://leetcode.com/problems/find-the-number-of-subsequences-with-equal-gcd/
class Solution {
    private let MOD = 1_000_000_007
    func subsequencePairCount(_ nums: [Int]) -> Int {
        
        let N = nums.count
        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: 205), count: 205), count: 205)
        //first:第一个序列的gcd；second：第二个序列的gcd；
        func dfs(_ first: Int?, _ second: Int?, _ curIdx: Int) -> Int {
            guard curIdx < N else {
                if let f = first, let s =  second {
                    return f == s ? 1 : 0
                }
                return 0
            }
            if let v = memo[first ?? 202][second ?? 202][curIdx] {
                return v
            }
            var sb = 0
            
            //加入第一个序列
            if let f = first {
                sb += dfs(gcd(nums[curIdx],f), second, curIdx + 1)
            } else {
                sb += dfs(nums[curIdx], second, curIdx + 1)
            }
            //加入第二个序列
            if let s = second {
                sb += dfs(first, gcd(s, nums[curIdx]), curIdx + 1)
            } else {
                sb += dfs(first, nums[curIdx], curIdx + 1)
            }
            //谁都不加入
            sb += dfs(first, second, curIdx + 1)
            sb %= MOD
            memo[first ?? 202][second ?? 202][curIdx] = sb
            return sb 
        }
        
        
        return dfs(nil, nil, 0)
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }
}

