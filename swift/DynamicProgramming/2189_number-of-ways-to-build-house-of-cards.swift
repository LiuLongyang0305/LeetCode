//  https://leetcode.com/problems/number-of-ways-to-build-house-of-cards/
class Solution {
    private let cardsOfEachLevel = (0..<170).map { 3 * $0 + 2}
    func houseOfCards(_ n: Int) -> Int {
        
        var memo = [Int:Int]()
        func dfs(_ remain: Int, _ last: Int) -> Int {
            
            if remain == 0 {
                return 1
            }
            
            if last == 0 && remain > 0 {
                return 0
            }
            let key = (remain << 10) | last
            guard nil == memo[key] else {return memo[key]!}
            var ans = 0
            
            for idx in 0..<170 {
                guard idx < last else {break}
                guard remain >= cardsOfEachLevel[idx] else {break}
                ans += dfs(remain - cardsOfEachLevel[idx], idx)
            }
            memo[key] = ans
            return ans
        }
        
        return dfs(n,200)
    }
}