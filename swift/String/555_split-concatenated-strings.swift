// https://leetcode.com/problems/split-concatenated-strings/
class Solution {
    func splitLoopedString(_ strs: [String]) -> String {
        let sortedStresCopy = strs.map { (str) -> String in
            let reversedStr = String(str.reversed())
            return str < reversedStr ? reversedStr : str
        }
        let N = strs.count
        var preffix = Array<String>(repeating: "", count: N)
        var suffix = Array<String>(repeating: "", count: N)
        for i in 1..<N {
            preffix[i] = preffix[i - 1] + sortedStresCopy[i - 1]
        }
        for i in stride(from: N - 2, through: 0, by: -1) {
            suffix[i] = sortedStresCopy[i + 1] + suffix[i + 1]
        }
        var ans = preffix[0] + sortedStresCopy[0] + suffix[0]
        for j in 0..<N {
            let M = sortedStresCopy[j].count
            let reversed = String(sortedStresCopy[j].reversed())
            for i in 1...M {
                let l1 = String(sortedStresCopy[j].prefix(i))
                let r1 = String(sortedStresCopy[j].suffix(M - i))
                let l2 = String(reversed.prefix(i))
                let r2 = String(reversed.suffix(M - i))
                ans = max(ans,r1 + suffix[j] + preffix[j] + l1,preffix[j] + l2 + r2 + suffix[j],r2 + suffix[j] + preffix[j] + l2)
            }
        }
        return ans
    }
}


