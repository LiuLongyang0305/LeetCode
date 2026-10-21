    // https://leetcode.cn/problems/maximum-requests-without-violating-the-limit/
    class Solution {
        func maxRequests(_ requests: [[Int]], _ k: Int, _ window: Int) -> Int {
            // 1. 按用户分组
            var userToRequest = [Int: [Int]]()
            for r in requests {
                userToRequest[r[0], default: []].append(r[1])
            }

            var totalAccepted = requests.count

            for (_, reqs) in userToRequest {
                let sortedReqs = reqs.sorted()
                // 维护当前滑动窗口内已接受的请求时间
                var slidingWindow: [Int] = []

                for t in sortedReqs {
                    // 1. 加入当前请求
                    slidingWindow.append(t)

                    // 2. 移除已过期的请求（不在 [t-window, t] 范围内）
                    while let first = slidingWindow.first, first < t - window {
                        slidingWindow.removeFirst()
                    }

                    // 3. 如果超限，拒绝最早的请求（移除队头）
                    if slidingWindow.count > k {
                        slidingWindow.removeLast()
                        totalAccepted -= 1
                    }
                }

                // slidingWindow 里剩下的就是该用户最终接受的请求
//                totalAccepted += slidingWindow.count
            }

            return totalAccepted
        }
    }
