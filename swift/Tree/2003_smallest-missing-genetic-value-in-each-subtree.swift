// https://leetcode.com/problems/smallest-missing-genetic-value-in-each-subtree/
class Solution {
    func smallestMissingValueSubtree(_ parents: [Int], _ nums: [Int]) -> [Int] {
        var valToIndex = [Int:Int]()
        let N = nums.count
        var tree = [[Int]](repeating: [], count: N + 5)

        (0..<N).forEach { idx in
            valToIndex[nums[idx]] = idx
            if -1 != parents[idx] {
                tree[parents[idx]].append(idx)
            }
        }
        var ans = [Int](repeating: 1, count: N)
        
        
        guard var idx = valToIndex[1] else {
            return ans
        }
        
        var visited = Array<Bool>(repeating: false, count: 1_000_05)
        var minLost = 1
        
        
        func dfs(_ node: Int) {
            visited[nums[node]] = true
            while visited[minLost] {
                minLost += 1
            }
            for child in tree[node] {
                dfs(child)
            }
        }
        
        dfs(idx)
        ans[idx] = minLost
        var last = idx
        idx = parents[idx]
        
        while -1 != idx {
            
            for child in tree[idx] {
                if child != last {
                    dfs(child)
                }
                
            }
            visited[nums[idx]] = true
            while visited[minLost] {
                minLost += 1
            }
            ans[idx] = minLost
            last = idx
            idx = parents[idx]
        }
        
        return ans
    }
}
