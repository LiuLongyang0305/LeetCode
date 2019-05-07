//https://leetcode.com/problems/n-repeated-element-in-size-2n-array/
class Q961_Solution {
    func repeatedNTimes(_ A: [Int]) -> Int {
        var countDic = Dictionary<Int,Int>()
        let halfLength = A.count / 2
        for num in A {
            if nil != countDic[num] {
                countDic[num] = countDic[num]! + 1
                if countDic[num]! == halfLength {
                    return num
                }
            } else {
                countDic[num] = 1
            }
        }
        return 0
    }
}