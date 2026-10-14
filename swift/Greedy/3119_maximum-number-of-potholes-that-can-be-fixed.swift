//https://leetcode.cn/problems/maximum-number-of-potholes-that-can-be-fixed/
class Solution {
    func maxPotholes(_ road: String, _ budget: Int) -> Int {

        let chars = [Character](road)
        let M = chars.count
        var sb = [Int]()
        var i = 0
        while i < M {
            while i < M && chars[i] == "." {
                i += 1
            }
            var j = i
            while j < M && chars[j] == "x" {
                j += 1
            }
            if j > i {
                sb.append(j - i)
            }
            i = j
        }
        sb.sort { $0 > $1}
        var remain = budget
        var cnt = 0
        for num in sb {
            let cur = min(num,remain - 1)
            cnt += cur
            remain -= (cur + 1)
            if remain <= 0 {
                break
            }
        }
        return cnt
    }
}
