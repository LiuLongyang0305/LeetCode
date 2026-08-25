//https://leetcode.cn/problems/weighted-sum-of-a-tree/
class Solution {
    func weightedSum(_ parent: [Int], _ nums: [Int]) -> Int {
        let N = parent.count
        var tree = [Int:[Int]]()
        for i in 0..<N {
            tree[parent[i],default: []].append(i)
        }



        func dfs(_ cur: Int) -> Int {
            guard let children = tree[cur] else {return 1}
            var maxChildDepth = 0
            for ch in children {
                maxChildDepth = max(maxChildDepth,dfs(ch))
            }
            return 1 + maxChildDepth
        }

        let height = dfs(0)
        var sb = 0

        func dfs(_ cur: Int, _ level: Int) {
            sb += nums[cur] * (height - level + 1)
            guard let children = tree[cur] else {return}
            for ch in children {
                dfs(ch,level + 1)
            }
        }

        dfs(0,1)
        return sb
    }
}
