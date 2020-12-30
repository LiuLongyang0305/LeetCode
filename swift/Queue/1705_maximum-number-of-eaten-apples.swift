// https://leetcode.com/problems/maximum-number-of-eaten-apples/
class Solution {
    private struct AppleAndRotDate {
        var count: Int
        var rotDate: Int
    }
    func eatenApples(_ apples: [Int], _ days: [Int]) -> Int {
        let N = apples.count
        var maxDay = 0
        for i in 0..<N {
            maxDay = max(maxDay, i + days[i])
        }
        var queue = [AppleAndRotDate]()
        func update(_ day: Int) {
            while !queue.isEmpty && queue[0].rotDate <= day {
                queue.removeFirst()
            }
            guard apples[day] > 0 else {
                return
            }
            let s = AppleAndRotDate(count: apples[day], rotDate: day + days[day])
            guard !queue.isEmpty else {
                queue.append(s)
                return
            }
            if queue[0].rotDate >= s.rotDate {
                queue.insert(s, at: 0)
                return
            }
            if queue.last!.rotDate <= s.rotDate {
                queue.append(s)
                return
            }
            
            var l = 0
            var r = queue.count - 1
            while l < r {
                let mid = l + (r - l) >> 1
                if queue[mid].rotDate == s.rotDate {
                    queue[mid].count += apples[day]
                    return
                } else if queue[mid].rotDate < s.rotDate {
                    if queue[mid + 1].rotDate >= s.rotDate {
                        queue.insert(s, at: mid + 1)
                        return
                    }
                    l = mid + 1
                } else {
                    if queue[mid - 1].rotDate <= s.rotDate {
                        queue.insert(s, at: mid)
                        return
                    }
                    r = mid - 1
                }
            }
        }
        var  cnt = 0
        for day in 0..<maxDay {
            if day < N {
                update(day)
            }
            if !queue.isEmpty {
                if queue[0].count == 1 {
                    queue.removeFirst()
                } else {
                    queue[0].count -= 1
                }
                cnt += 1
            }
        }
        return cnt
    }
}

