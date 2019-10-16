//https://leetcode.com/problems/next-greater-element-iii/
extension Int {
    func toArray() -> [Int] {
        var ans = [Int]()
        var i = self
        while i > 0 {
            ans.insert(i % 10, at: 0)
            i  /= 10
        }
        return ans
    }
}

class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        
        guard n > 10 else {
            return -1
        }
        
        var digits = n.toArray()
        var sortedDigits = digits.sorted {$0 > $1}
        
        if sortedDigits == digits  {
            return -1
        }
        
        if digits[1...].sorted(by: { (v1, v2) -> Bool in
            v1 > v2
        }) == Array<Int>(digits[1...]) {
            let  index = sortedDigits.lastIndex { (val) -> Bool in
                val > digits[0]
                }!
            var ans = sortedDigits.remove(at: index)
            ans = sortedDigits.reversed().reduce(ans) {$0 * 10 + $1}
            return ans > Int(Int32.max) ? -1 : ans
        }  else {
            var i = digits.count - 2
            while i > 0 && digits[i] >= digits[i + 1]{
                i -= 1
            }
            let temp = getMinNumberArray(Array<Int>(digits[i...]))
            digits.removeLast(temp.count)
            digits.append(contentsOf: temp)
            let ans =  digits.reduce(0) {$0 * 10 + $1}
            return ans > Int(Int32.max) ? -1 : ans
        }
    }
    
    private func getMinNumberArray(_ arr: [Int]) -> [Int] {
        var counter  = Array<Int>(repeating: 0, count: 10)
        var original = arr.reduce(0) {$0 * 10 + $1}
        var minNumberLargerThanOriginal = Int.max
        for ele in arr {
            counter[ele] += 1
        }
        let targetLength = arr.count
        func dfs(current: [Int],counter: [Int]) {
            if current.count == targetLength {
                let temp = current.reduce(0) {$0 * 10 + $1}
                if temp < minNumberLargerThanOriginal && temp  > original {
                    minNumberLargerThanOriginal = temp
                }
                return
            }
            
            var currentCopy = current
            var counterCopy = counter
            
            for i in 0...9 {
                if counterCopy[i] > 0 {
                    currentCopy.append(i)
                    counterCopy[i] -= 1
                    dfs(current: currentCopy, counter: counterCopy)
                }
            }
        }
        
        for i in 0..<10 {
            if counter[i] != 0 {
                var counterCopy = counter
                counterCopy[i] -= 1
                dfs(current: [i], counter: counterCopy)
            }
        }
        var ans = minNumberLargerThanOriginal.toArray()
        if ans.count  < targetLength {
            let zeros = Array<Int>(repeating: 0, count: targetLength - ans.count)
            ans.insert(contentsOf: zeros, at: 0)
        }
        return ans
    }
}