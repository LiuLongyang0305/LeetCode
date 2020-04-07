// https://leetcode.com/problems/kill-process/
class Solution1 {
    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var tree = [Int:[Int]]()
        let N = pid.count
        for i in 0..<N {
            if nil == tree[ppid[i]] {
                tree[ppid[i]] = []
            }
            tree[ppid[i]]?.append(pid[i])
        }
        var ans = [Int]()
        func dfs(_ node: Int) {
            ans.append(node)
            guard let children =  tree[node] else {
                return
            }
            for child in children {
                dfs(child)
            }
        }
        dfs(kill)
        return ans
    }
}

class Solution {
    func killProcess(_ pid: [Int], _ ppid: [Int], _ kill: Int) -> [Int] {
        var ans = [Int]()
        var ppids: Set<Int> = [kill]
        let N = ppid.count
        while !ppids.isEmpty {
            ans.append(contentsOf: ppids)
            var nextLevel = Set<Int>()
            for i in 0..<N {
                if ppids.contains(ppid[i]) {
                    nextLevel.insert(pid[i])
                }
            }
            ppids = nextLevel
        }
        return ans
    }
}
