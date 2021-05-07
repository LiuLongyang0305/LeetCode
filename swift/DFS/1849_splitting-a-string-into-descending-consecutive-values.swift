// https://leetcode.com/problems/splitting-a-string-into-descending-consecutive-values/
class Solution {
    func splitString(_ s: String) -> Bool {
        guard s.count > 1 else {
            return false
        }
        func check(_ maxNumber: Int, _ last: Int, _ remainStr: String) -> Bool {
            guard !remainStr.isEmpty else {
                return maxNumber != last
            }
            let target = last - 1
            guard target >= 0 else {
                return false
            }
            if let finalNum = Int(remainStr), finalNum == target {
                return true
            }
            var new = ""
            for ch in remainStr {
                new.append(ch)
                if let newNum = Int(new), target == newNum {
                    guard !check(maxNumber, target, String(remainStr.dropFirst(new.count))) else {
                        return true
                    }
                    
                }
            }
            return false
        }
        var left = ""
        var right = s
        while right.count > 1 {
            left.append(right.removeFirst())
            if let maxNumber = Int(left) {
                guard !check(maxNumber,maxNumber, right) else {
                    return true
                }
            }
        }
        return false
    }
}