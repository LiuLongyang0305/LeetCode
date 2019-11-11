//https://leetcode.com/problems/combination-sum-ii/
class Solution {
    private var ans = Set<[Int]>()
    private var candidates = [Int]()
    private var target = -1
    private var length  = -1
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.target = target
        self.candidates = candidates.sorted()
        self.length = candidates.count
        var arr = [Int]()
        var visited = Array<Bool>(repeating: false, count: length)
        backtracking(&arr, &visited, -1,0)
        return  Array<Array<Int>>(ans)
    }
    private func backtracking(_ arr: inout [Int],_ visited: inout [Bool], _ lastIndex: Int,_ sum: Int)  {
        if  sum == target {
            ans.insert(arr)
        }
        let start = lastIndex == -1 ? 0 : lastIndex + 1
        guard start < length else {
            return
        }
        guard sum < target else {
            return
        }
        for index in start..<length {
            var existed = Set<Int>()
            if !visited[index] && !existed.contains(candidates[index]){
                existed.insert(candidates[index])
                visited[index] = true
                arr.append(candidates[index])
                backtracking(&arr, &visited, index, sum + candidates[index])
                visited[index] = false
                arr.removeLast()
            }
        }
    }
}