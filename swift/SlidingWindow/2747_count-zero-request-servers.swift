//https://leetcode.com/problems/count-zero-request-servers/
class Solution {
    func countServers(_ n: Int, _ logs: [[Int]], _ x: Int, _ queries: [Int]) -> [Int] {
        let M = queries.count
        let N = logs.count
        let sortedIndices = (0..<M).sorted { queries[$0] < queries[$1]}
        let sortedLogs = logs.sorted { l1, l2 in
            l1[1] < l2[1]
        }
        var ans = [Int](repeating: 0, count: M)
        var serverIdToQueryTimes = [Int:Int]()
        var deleteIdx = 0
        var addIdx = 0
        for idx in sortedIndices {
            let rightTime = queries[idx]
            let leftTime = rightTime - x
            while addIdx < N && sortedLogs[addIdx][1] <= rightTime {
                serverIdToQueryTimes[sortedLogs[addIdx][0],default: 0] += 1
                addIdx += 1
            }
            while deleteIdx < N && sortedLogs[deleteIdx][1] < leftTime {
                serverIdToQueryTimes[sortedLogs[deleteIdx][0],default: 0] -= 1
                if let v = serverIdToQueryTimes[sortedLogs[deleteIdx][0]], v == 0 {
                    serverIdToQueryTimes.removeValue(forKey: sortedLogs[deleteIdx][0])
                }
                deleteIdx += 1
            }
            ans[idx] = n - serverIdToQueryTimes.count
        }
        return ans
    }
}
