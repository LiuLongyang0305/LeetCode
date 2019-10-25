//https://leetcode.com/problems/pancake-sorting/
class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        //空数组或者只有一个元素
        guard A.count > 1 else {
            return []
        }
        //已经是升序排列
        guard A.sorted() != A else {
            return []
        }
        //两次翻转保证最大的元素位于最后
        var ans = [Int]()
        let index = A.lastIndex(of: A.max()!)!
        var ACopy = A
        if index != A.count - 1{
            if index != 0 {
                ans.append(index + 1)
                for i in 0..<(index + 1) / 2 {
                    ACopy.swapAt(i, index - i)
                }
            }
            ans.append(A.count)
            for i in 0..<A.count / 2 {
                ACopy.swapAt(i, A.count - 1 - i)
            }
        }
        //递归处理前（n - 1）个无序元素
        ACopy.removeLast()
        ans.append(contentsOf: pancakeSort(ACopy))
        return ans
    }
}