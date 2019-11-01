//https://leetcode.com/problems/minimum-increment-to-make-array-unique/submissions/
class Solution {
    func minIncrementForUnique(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return 0
        }
         let maxEle = A.max()!
         var  existed = Array<Bool>(repeating: false, count: (maxEle + 1) << 1)
        var counter  = [Int:Int]()
        var ans =  0
        for ele in A {
            if let c = counter[ele] {
                counter[ele] = c + 1
            } else {
                counter[ele] = 1
            }
            existed[ele] = true
        }
        var lastNotExistIndex = -1
        let sortedNumbers = counter.keys.sorted()
        for num in sortedNumbers {
            if let c = counter[num], c > 1 {
                var j = max(num, lastNotExistIndex)
                for _ in 1...(c - 1) {
                    while existed[j] {
                        j += 1
                    }
                    existed[j] = true
                    ans += j - num
                    lastNotExistIndex = j  + 1
                }
            }
        }
        return ans
    }
}