//  https://leetcode.com/problems/pizza-with-3n-slices/
class Solution {
    func maxSizeSlices(_ slices: [Int]) -> Int {
        var memo = [Int:Int]()
        let N = slices.count - 1
        
        func dfs(_ curSlices: [Int], _ need: Int, _ idx: Int) -> Int {
            
            if idx == 0 {
                memo = [Int:Int]()
            }
            
            let key = (need << 10) | idx
            guard nil == memo[key] else {return memo[key]!}
            guard need > 0 else {
                return 0
            }
            
            guard idx < N else {
                return need == 0 ? 0 : Int.min
            }
            
            guard need > 0 else {return 0}

            var ans = 0
            
            ans = max(ans, curSlices[idx] + dfs(curSlices, need - 1, idx + 2),dfs(curSlices, need, idx + 1))
            
            memo[key] = ans
            
            return ans
        }
        
        
        let need = slices.count / 3
        return max(dfs([Int](slices.dropFirst() ), need , 0),dfs([Int](slices.dropLast()), need, 0))
    }
}