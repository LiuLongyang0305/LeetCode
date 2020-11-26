// https://leetcode.com/problems/smallest-string-with-a-given-numeric-value/
class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var arr = Array<Int>(repeating: 1, count: n)
        var temp = k - n
        var j = n - 1
        while temp > 0 {
            let t = min(25, temp)
            arr[j] += t
            temp -= t
            j -= 1
        }
        var ans = ""
        for num in arr {
            ans.append(Character(Unicode.Scalar.init(num + 96)!))
        }
        return ans
    }
}
class Solution1 {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        guard k > n else {
            return String(repeating: "a", count: n)
        }
        guard k < 26 * n else {
            return String(repeating: "z", count: n)
        }
        for cnt in 0..<n {
            var zcnt = n - cnt
            if zcnt * 26 + cnt == k {
                var ans = ""
                ans.append(String(repeating: "a", count: cnt))
                ans.append(String(repeating: "z", count: zcnt))
                return ans
            }
            zcnt = n - cnt - 1
            let mid = k - cnt - zcnt * 26
            if mid > 1 && mid < 26 {
                var ans = ""
                if cnt > 0 {
                    ans.append(String(repeating: "a", count: cnt))
                }
                ans.append(Character(Unicode.Scalar(mid + 96)!))
                if zcnt > 0 {
                    ans.append(String(repeating: "z", count: zcnt))
                }
                return ans
            }
        }
        return ""
    }
}

