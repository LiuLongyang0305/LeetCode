    //    https://leetcode.cn/problems/elevator-requests-iii/
class Solution {
    private typealias Triple = (i:Int,at:Int,floor:Int)
    func elevatorRequests(_ n: Int, _ start: Int, _ requests: [[Int]]) -> Int {
        let M = requests.count
        let arriveTime = requests.map {$0[0]}
        let floors = requests.map {$0[1]}
        let allVisited = (1 << M) - 1
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: M), count: 1 << M)


        func dfs(_ mask: Int, _ lastIdx: Int) -> Int {
            let newMask = mask ^ (1 << lastIdx)
            if newMask == 0 {
                return max(arriveTime[lastIdx], abs(start - floors[lastIdx] ))
            }

            if let c = memo[mask][lastIdx] {
                return c
            }

            var sb = Int.max
            for j in 0..<M {
                if ((newMask >> j & 1) > 0) {
                    sb = min(sb,dfs(newMask, j) + abs(floors[lastIdx] - floors[j]))
                }
            }
            sb = max(sb,arriveTime[lastIdx])
            memo[mask][lastIdx] = sb

            return sb
        }
        var sb = Int.max
        for idx in 0..<M {
            sb = min(sb,dfs(allVisited, idx))
        }
        return sb
    }
}

class Solution1 {

    func elevatorRequests(
        _ n: Int,
        _ start: Int,
        _ requests: [[Int]]
    ) -> Int {

        let M = requests.count

        let arriveTime = requests.map {
            $0[0]
        }

        let floors = requests.map {
            $0[1]
        }

        let allVisited = (1 << M) - 1

        var memo = Array(
            repeating: Array(
                repeating: nil as Int?,
                count: M
            ),
            count: 1 << M
        )

        func dfs(
            _ mask: Int,
            _ lastIdx: Int
        ) -> Int {

                // 当前状态已经计算过
            if let value = memo[mask][lastIdx] {
                return value
            }

                // 去掉最后一个请求
            let prevMask =
            mask ^ (1 << lastIdx)

                // 只有一个请求
            if prevMask == 0 {

                let result = max(
                    arriveTime[lastIdx],
                    abs(
                        start - floors[lastIdx]
                    )
                )

                memo[mask][lastIdx] = result

                return result
            }

            var result = Int.max

                // 枚举上一个完成的请求
            for j in 0..<M {

                    // j 必须属于 prevMask
                if ((prevMask >> j) & 1) != 0 {

                    let previous =
                    dfs(prevMask, j)

                    let distance =
                    abs(
                        floors[lastIdx]
                        - floors[j]
                    )

                    result = min(
                        result,
                        previous + distance
                    )
                }
            }

                // 到达 lastIdx 后，
                // request[lastIdx] 可能还没有到达
            result = max(
                result,
                arriveTime[lastIdx]
            )

            memo[mask][lastIdx] = result

            return result
        }

        var answer = Int.max

        for lastIdx in 0..<M {

            answer = min(
                answer,
                dfs(allVisited, lastIdx)
            )
        }
        
        return answer
    }
}
