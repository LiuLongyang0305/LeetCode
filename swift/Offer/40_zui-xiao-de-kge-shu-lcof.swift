// https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/
class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        let N = arr.max()! + 1
        var ans = Array<Int>()
        var count = Array<Int>(repeating: 0, count: arr.max()! + 1)
        
        for num in arr {
            count[num] += 1
        }
        for i in 0..<N where ans.count < k {
            if count[i] != 0 {
                for _ in 0..<count[i] where ans.count < k {
                    ans.append(i)
                }
            }
        }
        return ans
    }
}