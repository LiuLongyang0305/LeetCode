// https://leetcode.com/problems/2/
class Solution {
    private typealias BiNode = (left:Int?,right:Int?)
    private var tree = [BiNode]()
    private var maxScore = 0
    private var maxScoreCnt  = 0
    private var totalNodeCnt = 0
    func countHighestScoreNodes(_ parents: [Int]) -> Int {
        let N = parents.count
        self.tree = [BiNode](repeating: (nil,nil), count: N)
        for i in 1..<N {
            let p = parents[i]
            if let _ = tree[p].left {
                tree[p].right = i
            } else {
                tree[p].left = i
            }
        }
        self.maxScore = 0
        self.maxScoreCnt = 0
        self.totalNodeCnt = N
        let _ = dfs(0)
        return self.maxScoreCnt
    }
    
    private func dfs(_ node: Int?) -> Int {
        guard let n = node else {
            return 0
        }
        let leftCnt = dfs(tree[n].left)
        let rightCnt = dfs(tree[n].right)
        let othersCnt = totalNodeCnt - leftCnt - rightCnt - 1
        let s = max(1, leftCnt) * max(1, rightCnt) * max(1, othersCnt)
        if s == maxScore {
            maxScoreCnt += 1
        } else if s > maxScore {
            maxScore = s
            maxScoreCnt = 1
        }
        return 1 + leftCnt + rightCnt
    }
}