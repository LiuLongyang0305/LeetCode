//https://leetcode.com/problems/sort-array-by-parity/
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        if A.count < 2 {
            return A
        }
        var result = [Int]()
        for ele in A {
            if ele % 2 == 0 {
                result.insert(ele, at: 0)
            } else {
                result.append(ele)
            }
        }
        return result
    }
}

class Solution2 {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        if A.count < 2 {
            return A
        }
        var result = A
        var i = 0
        var j = A.count - 1
        while i < j {
            while i < j && result[i] % 2 == 0 {
                i += 1
            }
            while i < j && result[j] % 2 == 1 {
                j -= 1
            }
            if i < j {
                result.swapAt(i, j)
            }
        }
        return result
    }
}

class Solution3 {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        if A.count < 2 {
            return A
        }
        var result = [[Int](),[Int]()]
        for ele in A {
            result[ele % 2].append(ele)
        }
         result[0].append(contentsOf: result[1])
        return result[0]
    }
}