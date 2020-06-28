// https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/
class Solution {
    typealias Pair = (from: Int, to: Int)
    func longestSubarray(_ digits: [Int]) -> Int {
        guard digits.contains(0) else {
            return  digits.count - 1
        }
        guard digits.contains(1) else {
            return  0
        }
        var onesSection = [Pair]()
        
        var maxLength = Int.min
        let N = digits.count
        
        var from = -1
        var to = -1
        
        for index in 0..<N {
            if digits[index] == 1 {
                if from == -1 {
                    from = index
                } 
                to = index
            } else {
                if from != -1 && to != -1 {
                    onesSection.append((from,to))
                    from = -1
                    to = -1
                }
            }
        }
        if digits.last! == 1{
            onesSection.append((from,to))
        }
        onesSection.forEach { (pair) in
            maxLength = max(maxLength, pair.to - pair.from + 1)
        }
        guard onesSection.count > 1 else {
            return maxLength
        }
        
        
        for i in 0..<(onesSection.count - 1) {
            if onesSection[i + 1].from - onesSection[i].to == 2 {
                maxLength = max(maxLength, onesSection[i + 1].to - onesSection[i].from)
            }
        }
        return maxLength
    }
}