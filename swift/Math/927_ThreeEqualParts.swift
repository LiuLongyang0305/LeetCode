// https://leetcode.com/problems/three-equal-parts/
class Solution {
    func threeEqualParts(_ A: [Int]) -> [Int] {
        guard A.count >= 3 else {
            return [-1,-1]
        }
        
        let N = A.count
        var onesCount = A.reduce(0) { $0 + $1}
        
        guard onesCount != 0 else {
            return [0,2]
        }
        guard onesCount % 3 == 0 else {
            return [-1,-1]
        }
        let oneThird = onesCount / 3
        
        var left = -1,right = -1,mid = -1,mid2 = -1
        onesCount = 0
        
        for i in 0..<N {
            onesCount += A[i]
            if left == -1 && onesCount == oneThird {
                left = i
            }
            if onesCount == oneThird << 1 {
                right = i
            }
            if onesCount == oneThird {
                mid = i
            }
            if mid2 == -1 && onesCount == oneThird << 1 {
                mid2 = i
            }
        }
        right += 1
        mid += 1
        var targetStr = ""
        A[right...].forEach { (val) in
            if val != 0 || !targetStr.isEmpty {
                targetStr += "\(val)"
            }
        }
        var leftStr = ""
        A[0...left].forEach { (val) in
            if val != 0 || !leftStr.isEmpty {
                leftStr += "\(val)"
            }
        }
        var deltaLength = targetStr.count - leftStr.count
        if deltaLength < 0 {
            return [-1,-1]
        } else if deltaLength  == 0 {
            guard targetStr == leftStr else {
                return [-1,-1]
            }
        } else {
            guard mid - left - 1 >= deltaLength else {
                return [-1,-1]
            }
            left = left + deltaLength
        }
        
        var midStr = ""
        A[mid...mid2].forEach { (val) in
            if val != 0 || !leftStr.isEmpty {
                midStr += "\(val)"
            }
        }
        deltaLength = targetStr.count - midStr.count
        if deltaLength < 0 {
            return [-1,-1]
        } else if deltaLength  == 0 {
            return midStr == targetStr ? [left,mid2 + 1] : [-1,-1]
        } else {
            guard right - mid2 - 1 >= deltaLength else {
                return [-1,-1]
            }
            
            right = mid2 + deltaLength + 1
        }
        return [left,right]
    }
}



