// https://leetcode.com/problems/maximum-binary-string-after-change/
class Solution {
    func maximumBinaryString(_ binary: String) -> String {
        guard let firstIdx = binary.firstIndex(of: "0") else {
            return binary
        }
        var ans = ""
        if firstIdx != binary.startIndex {
            ans += String(binary[binary.startIndex..<firstIdx])
        }
        var zeroCnt = 0
        var idx = firstIdx
        while idx < binary.endIndex {
            if binary[idx] == "0" {
                zeroCnt += 1
            }
            idx = binary.index(after: idx)
        }
        let oneCnt = binary.distance(from: firstIdx, to: binary.endIndex) - zeroCnt
        if zeroCnt >  1 {
            ans += String(repeating: "1", count: zeroCnt - 1)
        }
        ans += "0"
        if oneCnt > 0 {
        ans.append(String(repeating: "1", count: oneCnt))
        }
        return ans
    }
}

