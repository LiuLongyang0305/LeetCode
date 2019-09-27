//https://leetcode.com/problems/4sum/
class Solution {
    typealias Indices = (left:Int,right:Int)
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return [[Int]]()
        }
        var ans = Set<[Int]>()
        let sortedNums = nums.sorted()
        var twoSumMap = [Int:[Indices]]()
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                let sum = sortedNums[i] + sortedNums[j]
                if nil == twoSumMap[sum] {
                    twoSumMap[sum] = [Indices]()
                }
                twoSumMap[sum]?.append((i,j))
            }
        }
        guard target >= 4 * sortedNums[0] && target <= 4 * sortedNums[nums.count -  1] else {
                    return [[Int]]()
        }
        for (key1,val1) in twoSumMap {
            if let val2 = twoSumMap[target - key1] {
                for ids1  in val1 {
                    for ids2 in val2 {
                        let temp:Set<Int> = [ids1.left,ids1.right,ids2.left,ids2.right]
                        if temp.count == 4 {
                            let sortedTemp = temp.sorted { (v1, v2) -> Bool in
                                v1 < v2
                            }
                            ans.insert([sortedNums[sortedTemp[0]],sortedNums[sortedTemp[1]],sortedNums[sortedTemp[2]],sortedNums[sortedTemp[3]]])
                        }
                    }
                }

            }
        }
        return Array<[Int]>(ans)
    }
}