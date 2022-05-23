// https://leetcode.com/problems/max-chunks-to-make-sorted-ii/
class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        let sortedArr = arr.sorted()
        let N = sortedArr.count
        var arrCounter = [Int:Int]()
        var sortedArrCounter = [Int:Int]()
        var cnt = 0
        for i in 0..<N {
            arrCounter[arr[i],default: 0] += 1
            sortedArrCounter[sortedArr[i],default: 0] += 1
            if(sortedArrCounter == arrCounter) {
                cnt += 1
                arrCounter = [:]
                sortedArrCounter = [:]
            }

        }
        return cnt
    }
}