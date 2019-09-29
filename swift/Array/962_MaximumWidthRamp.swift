//https://leetcode.com/problems/maximum-width-ramp/
class Solution {
    typealias Indices = (right: Int,left: Int)
    func maxWidthRamp(_ A: [Int]) -> Int {
        var indicesDic = [Int:Indices]()
        for i in 0..<A.count {
            if indicesDic[A[i]] == nil {
                indicesDic[A[i]] = (i,i)
            } else {
                indicesDic[A[i]]?.right = i
            }
        }
        // print(indicesDic)
        let sortedIndex = indicesDic.sorted { (dic1, dic2) -> Bool in
            dic1.key < dic2.key
        }
        var maxIndex: Indices = sortedIndex[0].value
        var ans = maxIndex.right - maxIndex.left
        if sortedIndex[0].value.right !=  sortedIndex[0].value.left {
            ans = sortedIndex[0].value.right - sortedIndex[0].value.left
        }
        for i in 1..<sortedIndex.count {
            let val = sortedIndex[i].value
            if val.right <= maxIndex.left {
                ans = max(ans, val.right - val.left)
                maxIndex.left = val.left
            } else {
                if val.right <= maxIndex.right {
                    ans = max(ans, val.right - maxIndex.left,val.right - val.left)
                    maxIndex.left = min(val.left, maxIndex.left)
                } else {
                    if val.left <= maxIndex.left {
                        ans = val.right - val.left
                        maxIndex.left = val.left
                    } else if val.left > maxIndex.right {
                        ans = val.right - maxIndex.left
                    } else {
                        ans = max(ans, val.right - val.left,val.right - maxIndex.left)
                    }
                    maxIndex.right = val.right
                }
            }
        }
        return ans
    }
}