//https://leetcode.com/problems/replace-the-substring-for-balanced-string/
class Solution {
    private let map: [Character:Int]  = ["W":0,"Q": 1,"E":2,"R":3]
    func balancedString(_ s: String) -> Int {
        let N = s.count
        var counter = Array<Int>(repeating: 0, count: 4)
        let sMapArr = s.map{ map[$0]!}
        var preCounter = Array<[Int]>(repeating: counter, count: N + 1)
        for i in 0..<N {
            counter[sMapArr[i]] += 1
            preCounter[i + 1] = counter
        }
        let targetNumber = s.count >> 2
        var targetCounter = Array<Int>(repeating: 0, count: 4)
        var targetLength = 0
        for i in 0...3 {
            if counter[i] > targetNumber {
                targetCounter[i] = counter[i] - targetNumber
                targetLength += counter[i] - targetNumber
            }
        }
        
        guard targetLength != 0 else {
            return 0
        }
        
        func checkCounter(_ first: Int, _ length: Int) -> Bool {
            let second = first + length - 1
            for i in 0...3 {
                if preCounter[second][i] - preCounter[first - 1][i] < targetCounter[i] {
                    return false
                }
            }
            return true
        }
        
        var minLength = N
        var firstIndex = 1
        
        while true {
            var maxLength = N - firstIndex + 1
            if maxLength < targetLength {
                break
            }
            maxLength = min(maxLength, minLength)
            if !checkCounter(firstIndex, maxLength) {
                firstIndex += 1
                continue
            }
            
            var left = targetLength
            var right = maxLength
            
            while left < right {
                let mid = left + (right - left) >> 1
                if checkCounter(firstIndex, mid) {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            minLength = min(minLength, left)
            
            firstIndex += 1
        }
        
        return minLength
    }
 }
 