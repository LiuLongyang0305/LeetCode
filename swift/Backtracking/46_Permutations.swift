
//https://leetcode.com/problems/permutations/
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let length = nums.count
        
        func dfs(_ currentAns: inout [Int], _ visited: inout Set<Int>) {
            if visited.count == length {
                ans.append(currentAns)
                return
            }
            for num in nums {
                if !visited.contains(num) {
                    currentAns.append(num)
                    visited.insert(num)
                    dfs(&currentAns, &visited)
                    currentAns.removeLast()
                    visited.remove(num)
                }
            }
        }
        
        var visited = Set<Int>()
        for num in nums {
            var temp = [num]
            visited.insert(num)
            dfs(&temp, &visited)
            visited.remove(num)
        }
        return ans
    }
}