// https://leetcode.com/problems/recover-the-original-array/
class Solution {
    func recoverArray(_ nums: [Int]) -> [Int] {
        var counter = [Int:Int]()
        nums.forEach { counter[$0,default: 0] += 1}
        let sortedCounter = counter.sorted { p1, p2 in
            return p1.key < p2.key
        }
        var keyToIndices = [Int:Int]()
        let M = sortedCounter.count
        for i in 0..<M {
            keyToIndices[sortedCounter[i].key] = i
        }
        
        let possibleDoubleK = getPossibleDoubleK(nums)
        
        for doubleK in possibleDoubleK {
            let t = caculateOriginalNums(sortedCounter, keyToIndices, doubleK)
            guard t.isEmpty else {
                return t
            }
        }
        return []
    }
    
    
    private func getPossibleDoubleK(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var possibleTwoKsBasedMinEle =  Set<Int>()
        var possibleTwoKsBasedMaxEle = Set<Int>()
        let N = nums.count
        for ele in nums {
            let m = ele - sortedNums[0]
            if m != 0 && m % 2 == 0 {
                possibleTwoKsBasedMinEle.insert(m)
            }
            let n = sortedNums[N - 1] - ele
            if n != 0 && n % 2 == 0 {
                possibleTwoKsBasedMaxEle.insert(n)
            }
        }
       return [Int](possibleTwoKsBasedMaxEle.intersection(possibleTwoKsBasedMinEle))
    }
    
    private func caculateOriginalNums(_ sortedCounter: [(key:Int,value:Int)], _ keyToIndices: [Int:Int], _ doubleK: Int) -> [Int] {
        let half = (doubleK >> 1)
        let M = sortedCounter.count
        var ans = [Int]()
        var curSortedCounter = sortedCounter
        for idx in 0..<M {
            guard curSortedCounter[idx].value > 0 else {
                continue
            }
            let small = curSortedCounter[idx].key
            let big = small + doubleK
            guard let secondIdx = keyToIndices[big] else {
                return []
            }
            guard curSortedCounter[secondIdx].value >= curSortedCounter[idx].value  else {
                return []
            }
            ans += [Int](repeating: small + half, count: curSortedCounter[idx].value)
            curSortedCounter[secondIdx].value -= curSortedCounter[idx].value
            curSortedCounter[idx].value = 0
        }
        return ans
    }
}
