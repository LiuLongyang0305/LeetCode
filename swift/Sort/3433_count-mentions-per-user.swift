//https://leetcode.cn/problems/count-mentions-per-user
class Solution {
    func countMentions(_ numberOfUsers: Int, _ events: [[String]]) -> [Int] {
        var ans = [Int](repeating: 0, count: numberOfUsers)
        var onLineTime = [Int](repeating: 0, count: numberOfUsers)
        for event in events.sorted(by: { e1, e2 in
            let t1 = Int(e1[1])!, t2 = Int(e2[1])!
            if t1 == t2 {
                return e1[0] == "OFFLINE"
            }
            return t1 < t2
        }) {
            let time = Int(event[1])!
            if event[0] == "MESSAGE" {
                if event[2] == "ALL" {
                    for i in  0..<numberOfUsers {
                        ans[i] += 1
                    }
                } else if event[2] == "HERE" {
                    for i in 0..<numberOfUsers {
                        if onLineTime[i] <= time {
                            ans[i] += 1
                        }
                    }
                } else {
                    let ids = event[2].split { $0 == " "}.map { String($0)}.map { Int($0.dropFirst(2))!}
                    for id in ids {
                        ans[id] += 1
                    }

                }
            } else if event[0] == "OFFLINE" {
                let id = Int(event[2])!
                onLineTime[id] = time + 60
            }
        }
        return ans
    }
}

