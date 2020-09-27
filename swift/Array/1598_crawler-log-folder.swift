// https://leetcode.com/problems/crawler-log-folder/
class Solution {
    func minOperations(_ logs: [String]) -> Int {
        var cnt = 0
        for log in logs {
            if log == "../" {
                cnt = max(cnt - 1, 0)
            } else if log == "./" {
                continue
            } else {
                cnt += 1
            }
        }
        return cnt
    }
}