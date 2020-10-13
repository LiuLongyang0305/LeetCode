// https://leetcode-cn.com/problems/minimum-cost-to-connect-sticks/
class Solution {
    func connectSticks(_ sticks: [Int]) -> Int {
        guard sticks.count > 2 else {
            return sticks.count == 1 ? 0 : (sticks[0] + sticks[1])
        }
        var sortedSticks = sticks.sorted()
        var ans = 0
        func insert(_ newStick: Int) {
            guard !sortedSticks.isEmpty else {
                sortedSticks.append(newStick)
                return
            }
            guard sortedSticks[0] < newStick else {
                sortedSticks.insert(newStick, at: 0)
                return
            }
            guard sortedSticks.last! > newStick else {
                sortedSticks.append(newStick)
                return
            }
            var l = 0
            var r = sortedSticks.count - 1
            while l < r {
                let mid = l + (r - l) >> 1
                if sortedSticks[mid] == newStick {
                    sortedSticks.insert(newStick, at: mid)
                    return
                } else if sortedSticks[mid] > newStick {
                    if sortedSticks[mid - 1] <= newStick {
                        sortedSticks.insert(newStick, at: mid)
                        return
                    }
                    r = mid - 1
                } else {
                    if sortedSticks[mid + 1] >= newStick {
                        sortedSticks.insert(newStick, at: mid + 1)
                        return
                    }
                    l = mid + 1
                }
            }
            sortedSticks.insert(newStick, at: l)
        }
        while sortedSticks.count > 1 {
            let newStick = sortedSticks[0] + sortedSticks[1]
            ans += newStick
            sortedSticks.removeFirst(2)
            insert(newStick)
        }
        return ans
    }
}
