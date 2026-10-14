// https://leetcode.cn/problems/good-indices-in-a-digit-string/
class Solution {
    func goodIndices(_ s: String) -> [Int] {
        var sb = [Int]()
        let chars = [Character](s)

        func check(_ i: Int) -> Bool {
            let iToChars = [Character]("\(i)")
            let N = iToChars.count
            let s = i - N + 1
            for delta in 0..<N {
                guard chars[s + delta] == iToChars[delta] else {return false}
            }
            return true
        }


        let M = chars.count
        for i in 0..<M {
            if check(i) {
                sb.append(i)
            }
        }
        return sb
    }
}
