//https://leetcode.com/problems/permutations-ii/
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = Set<[Int]>()
        let length = nums.count
        func backtracking(_ currentArr: inout [Int], _ visited: inout [Bool]){
            guard currentArr.count != length else {
                ans.insert(currentArr)
                return
            }
            for i in 0..<length {
                var existed = Set<Int>()
                if !visited[i] && !existed.contains(nums[i]) {
                    currentArr.append(nums[i])
                    visited[i] = true
                    existed.insert(nums[i])
                    backtracking(&currentArr, &visited)
                    currentArr.removeLast()
                    visited[i] = false
                }
            }
        }
        var currentArr = [Int]()
        var visited = Array<Bool>(repeating: false, count: nums.count)
        backtracking(&currentArr, &visited)
        return [[Int]](ans)
    }
}