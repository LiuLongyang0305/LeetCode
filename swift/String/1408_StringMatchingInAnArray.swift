// https://leetcode.com/problems/string-matching-in-an-array/
class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var ans = [String]()
        let wordsSorted = words.sorted { $0.count < $1.count }
        let N = words.count
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                let M = wordsSorted[i].count
                var flag = false
                for k in 0...(wordsSorted[j].count - M) {
                    let startIndex = wordsSorted[j].index(wordsSorted[j].startIndex, offsetBy: k)
                    let endIndex = wordsSorted[j].index(wordsSorted[j].startIndex, offsetBy: k + M - 1)
                    if String(wordsSorted[j][startIndex...endIndex]) == wordsSorted[i] {
                        ans.append(wordsSorted[i])
                        flag = true
                        break
                    }
                }
                if flag {
                    break
                }
            }
        }
        return ans
    }
}

