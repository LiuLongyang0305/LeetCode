    // https://leetcode.com/problems/sender-with-largest-word-count/
class Solution {
    func largestWordCount(_ messages: [String], _ senders: [String]) -> String {
        let N = messages.count
        var counter = [String:Int]()
        for i in 0..<N {
            counter[senders[i], default: 0] += messages[i].reduce(1, { $0 + ($1 == " " ? 1 : 0)})
        }
        var maxCnt = -1
        var ans = ""
        for (name,cnt) in counter {
            if maxCnt == -1 {
                ans = name
                maxCnt = cnt
                continue
            }
            if maxCnt < cnt {
                maxCnt = cnt
                ans = name
                continue
            }
            if maxCnt == cnt {
                ans = max(ans,name)
            }
        }
        return ans
    }
}