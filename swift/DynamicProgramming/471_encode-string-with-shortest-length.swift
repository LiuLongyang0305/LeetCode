// https://leetcode.com/problems/encode-string-with-shortest-length/
class Solution {
    private struct State: Hashable {
        var leftIdx: String.Index
        var rightIdx: String.Index
    }

    private var memo = [State:String]()
    private var str = ""

    func encode(_ s: String) -> String {

        self.memo = [:]
        self.str = s

        return helper(str.startIndex,str.index(before: str.endIndex))
    }

    private func helper(_ left: String.Index , _ right: String.Index) -> String {

        guard str.distance(from: left, to: right) + 1 > 4 else {
            return String(str[left...right])
        }

        let key = State(leftIdx: left, rightIdx: right)

        guard nil == memo[key] else {
            return memo[key]!
        }

        let t = str[left...right]
        var ans = String(t)
        if let uint = getEncodeUint(t) {
            let repeatTime = t.count / uint.count
            let length = uint.count + 2 + "\(repeatTime)".count
            if length < ans.count {
                ans = "\(repeatTime)[\(helper(uint.startIndex, uint.index(before: uint.endIndex)))]"
            }
        }

        var idx = left
        while idx < right {
            let l = helper(left, idx)
            let r = helper(str.index(after: idx), right)
            if l.count + r.count < ans.count {
                ans = l + r
            }
            idx = str.index(after: idx)
        }
        
        memo[key] = ans
        return ans
    }
    
    private func getEncodeUint(_ s: Substring) -> Substring? {
        let N = s.count
        let newStr = s + s
        if let idx = newStr.dropFirst().range(of: s)?.lowerBound {
            let l = newStr.distance(from: newStr.startIndex, to: idx)
            guard l < N else {
                return nil
            }
            return s.prefix(l)
        }
        return nil
    }
}