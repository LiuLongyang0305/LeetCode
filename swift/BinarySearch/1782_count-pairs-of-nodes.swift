// https://leetcode.com/problems/count-pairs-of-nodes/
class Solution {
    func countPairs(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        var degree = [Int](repeating: 0, count: n)
        var dumplicateEgesCnt = [[Int:Int]](repeating: [:], count: n)
        for edge in edges {
            let (s,e) = (edge[0] - 1, edge[1] - 1)
            degree[s] += 1
            degree[e] += 1

            dumplicateEgesCnt[min(s, e)][max(s, e),default: 0] += 1
        }
        let sortedDegree = degree.sorted()

        let M = queries.count
        var ans = [Int](repeating: 0, count: M)
        for i in 0..<M {
            var l = 0
            var r = n - 1
            var cnt = 0
            while l < r {
                while l < r && sortedDegree[l] + sortedDegree[r] <= queries[i] {
                    l += 1
                }
                if l < r {
                    cnt += r - l
                }
                r -= 1
            }
            guard cnt > 0 else {continue}

            for s in 0..<n  {
                guard !dumplicateEgesCnt[s].isEmpty else {continue}
                for (e,c) in dumplicateEgesCnt[s] {
                    if degree[s] + degree[e] > queries[i] && degree[e] + degree[s] - c <= queries[i] {
                        cnt -= 1
                    }
                }
            }
            ans[i] = cnt
        }

        return ans
    }
}

class Solution1 {
    private let INF = 1_000_000_007
    func countPairs(_ n: Int, _ edges: [[Int]], _ queries: [Int]) -> [Int] {
        var degree = [Int](repeating: 0, count: n)
        var dumplicateEgesCnt = [Int:Int]()
        for edge in edges {
            let (s,e) = (edge[0] - 1, edge[1] - 1)
            degree[s] += 1
            degree[e] += 1
            let key = max(s, e) << 40 | min(e, s)
            dumplicateEgesCnt[key,default: 0] += 1
        }
        let sortedDegree = [-1] + degree.sorted() + [INF]

        let M = queries.count
        var ans = [Int](repeating: 0, count: M)
        for i in 0..<M {
            var cnt = 0

            for s in 1...n {

                var left = s + 1
                var right = n + 1

                while left < right {
                    let mid = (left + right) >> 1
                    if sortedDegree[mid] + sortedDegree[s] > queries[i] {
                        right = mid
                    } else {
                        left = mid + 1
                    }
                }

                cnt += max(0, n + 1 - right)

            }



            guard cnt > 0 else {continue}
            for (key,c) in dumplicateEgesCnt {
                let (e,s) = (key >> 40, key & 0xfffff)
                if(degree[e] + degree[s] > queries[i] && degree[e] + degree[s] - c <= queries[i]) {
                    cnt -= 1
                }
            }
            ans[i] = cnt
        }

        return ans
    }
}
