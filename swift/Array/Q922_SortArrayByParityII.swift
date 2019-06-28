//https://leetcode.com/problems/sort-array-by-parity-ii/
class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        
        var result = A
        var oddIndex = [Int]()
        var evenIndex = [Int]()
        for i in 0..<A.count {
            if i % 2 == 0 {
                if A[i] % 2 == 1 {
                    evenIndex.append(i)
                }
            } else {
                if A[i] % 2 == 0 {
                    oddIndex.append(i)
                }
            }
        }
        for i in 0..<oddIndex.count {
            result.swapAt(oddIndex[i], evenIndex[i])
        }
        return result
    }
}

class Solution2 {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        
        var result = Array<Int>(repeating: 0, count: A.count)
        var i = 0
        var j = 1
        for ele in A {
            if ele % 2 == 0 {
                result[i] = ele
                i += 2
            } else {
                result[j] = ele
                j += 2
            }
        }
        return result
    }
}
