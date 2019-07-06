//https://leetcode.com/problems/add-to-array-form-of-integer/
class Solution {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {

        var KCopy = K
        var tempArray = [Int]()
        while KCopy > 0 {
            tempArray.insert(KCopy % 10, at: 0)
            KCopy /= 10
        }
        var result = A
        if tempArray.count > A.count {
            result = tempArray
            tempArray = A
        }
        var carry = 0
        let resultSize = result.count
        let tempArraySize = tempArray.count
        
        for i in 0..<tempArraySize {
            let num = tempArray[tempArraySize - 1 - i] + carry + result[resultSize - 1 - i ]
            result[resultSize - 1 - i ] = num % 10
            carry = num / 10
        }
        if carry == 1 {
            var j = resultSize - tempArraySize - 1
            print(j)
            while j >= 0 && carry == 1 {
                let num = result[j]
                result[j] = num < 9 ? num + 1 : 0
                carry = num == 9 ? 1 : 0
                j -= 1
            }
            if carry == 1 {
                result.insert(1, at: 0)
            }
        }
        return result
    }
}