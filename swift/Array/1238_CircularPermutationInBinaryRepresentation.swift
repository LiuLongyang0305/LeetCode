//https://leetcode.com/contest/weekly-contest-160/problems/find-positive-integer-solution-for-a-given-equation/
class Solution {
    func circularPermutation(_ n: Int, _ start: Int) -> [Int] {
        var grayCode = createGrayCode(n)
        var i = 0
        while grayCode[i] != start {
            i += 1
        }
        if i > 0 {
            grayCode.append(contentsOf: grayCode[0..<i])
            grayCode.removeFirst(i)
        }
        return grayCode
    }
     private  func createGrayCode(_ bitsCount: Int) -> [Int] {
        var ans = [Int]()
        ans.append(0)
        ans.append(1)

        guard bitsCount > 1 else {
            return ans
        }
        var delta = 1
        for _ in 2...bitsCount {
            delta *= 2
            ans.append(contentsOf: ans.reversed().map{$0 + delta})
        }
        
        return ans
    }
}