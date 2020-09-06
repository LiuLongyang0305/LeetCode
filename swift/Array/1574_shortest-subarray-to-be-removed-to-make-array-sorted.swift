// https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/
class Solution {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var ans = 0
        let N = arr.count
        var arrCopy = arr
        guard  N > 1 else {
            return 0
        }
        var leftArr = [Int]()
        while  !arrCopy.isEmpty && (leftArr.isEmpty || arrCopy.first! >= leftArr.last!){
                leftArr.append(arrCopy.removeFirst())
        }
        guard leftArr.count != N else {
            return 0
        }
        ans = leftArr.count
        var rightArr = [Int]()
        while !arrCopy.isEmpty && (rightArr.isEmpty || arrCopy.last! <= rightArr.first!) {
                rightArr.insert(arrCopy.removeLast(), at: 0)
            
        }
        
                // print(rightArr)
        ans = max(ans, rightArr.count)
        for i in 0..<leftArr.count {
            if let r = rightArr.firstIndex(where: {$0 >= leftArr[i]}) {
                //                print("\(leftArr[i])   \(rightArr[r]) ")
                ans = max(i + 1 + rightArr.count - r, ans)
            } else {
                ans = max(leftArr.count,rightArr.count, ans)
                break
            }
        }
        return arr.count - ans
    }
}
// let arr = [36,6,1,19,26,24,27,34,2,16,31,10,8,2,10,14,29,35,37]

