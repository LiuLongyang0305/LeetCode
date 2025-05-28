// https://leetcode.cn/problems/count-days-without-meetings/
class Solution {
    func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
        var counter = [Int:Int]()
        for m in meetings {
            counter[m[0],default: 0] += 1
            counter[m[1] + 1,default: 0] -= 1
        }
        let sortedCounter = counter.sorted {$0.key < $1.key}
        var ans = 0
        if let meetStart = sortedCounter.first?.key, meetStart != 1 {
            ans += meetStart - 1
        }
        if let end = sortedCounter.last?.key, end < days + 1 {
            ans += days - end + 1
        }
        var s = 0
        let N = sortedCounter.count

        for i in 0..<sortedCounter.count {
            s += sortedCounter[i].value
            if s == 0 {
                if i + 1 < N {
                    ans += sortedCounter[i + 1].key - sortedCounter[i].key
                }
            }
        }
        return ans
    }
}
