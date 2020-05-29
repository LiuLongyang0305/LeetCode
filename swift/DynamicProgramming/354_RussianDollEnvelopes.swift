// https://leetcode.com/problems/russian-doll-envelopes/
class Solution {
    private typealias Envelope = (width:Int,height:Int)
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 1 else {
            return envelopes.count
        }
        var ans = 0
        let sortedEnvelopes = envelopes.map { (envelope) -> Envelope in
            return (envelope[0],envelope[1])
        }.sorted { (enve1, enve2) -> Bool in
            enve1.width < enve2.width
        }
        var arr = [[sortedEnvelopes[0]]]
        func check(_ length: Int, currentEnvelope: Envelope) -> Bool {
            for e in arr[length] {
                if currentEnvelope.width > e.width && currentEnvelope.height > e.height {
                    return true
                }
            }
            return false
        }
        let N = envelopes.count
        for i in 1..<N {
            var length = arr.count - 1
            let currentEnvelope = sortedEnvelopes[i]
            while length >= 0 {
                if check(length, currentEnvelope: currentEnvelope) {
                    break
                }
                length -= 1
            }
            let currentMaxLength = length + 2
            if currentMaxLength > arr.count {
                arr.append([])
            }
            arr[currentMaxLength - 1].append(currentEnvelope)
            ans = max(ans, currentMaxLength)
        }
        return ans
    }
}

