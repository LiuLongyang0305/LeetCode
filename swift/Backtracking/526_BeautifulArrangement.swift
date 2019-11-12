//https://leetcode.com/problems/beautiful-arrangement/
class Solution {
    private var N = -1
    private var possibleNums = [Set<Int>]()
    var ans = 0
    func countArrangement(_ N: Int) -> Int {
        guard N > 1 else {
            return 1
        }
        
        self.N =  N
        possibleNums = Array<Set<Int>>(repeating: Set<Int>(), count: N + 1)
        getPossibleNums()
        var visited = Set<Int>()
        for num in possibleNums[1] {
            visited.insert(num)
            dfs(2, &visited)
            visited.remove(num)
        }
        return ans
    }
    private func getPossibleNums() {
        for num in 1...N {
            for i in 1...N {
                if num % i == 0 || i % num == 0  {
                    possibleNums[i].insert(num)
                }
            }
        }
    }
    
    private func dfs(_ next: Int, _ visited: inout Set<Int>)  {
        guard next != N + 1 else {
            ans += 1
            return
        }
        for num in possibleNums[next] {
            if !visited.contains(num) {
                visited.insert(num)
                dfs(next + 1, &visited)
                visited.remove(num)
            }
        }
    }
}