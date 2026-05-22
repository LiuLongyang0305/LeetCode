// https://leetcode.com/problems/minimum-difference-in-sums-after-removal-of-elements
class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {

        let M = nums.count
        let N = M / 3

        //相当于枚举前后来年各个序列的分界点，分界点前面取N个最小值，分界点后面取N个最大值
        var leftHeap = Heap<Int>(nums[0..<N])
        var sumLeft = nums.dropLast(N * 2).reduce(0) { $0 + $1}

        let sortedIndices = (N..<M).sorted { nums[$0] > nums[$1]}
        var sumRight = sortedIndices.dropLast(N).reduce(0) { $0 + nums[$1]}

        var sb = sumLeft - sumRight

        //右边部分可供选择的下标
        let remainIndices = [Int](sortedIndices[N...])
        // 右边部分当前N的最大值的下标
        var  rightChoosedIndex = Set<Int>(sortedIndices[..<N])

        var i = 0

        for idx in N..<(N * 2) {
            
            if nums[idx] < leftHeap.max! {
                //保证左边极可能小，淘汰大的换小的
                sumLeft += nums[idx]
                sumLeft -= leftHeap.popMax()!
                leftHeap.insert(nums[idx])
            }
            if rightChoosedIndex.contains(idx) {
                //淘汰掉不在区间里面的，换上可供选择的最大值
                sumRight -= nums[idx]
                while i < N && remainIndices[i] < idx {
                    i += 1
                }
                sumRight += nums[remainIndices[i]]
                rightChoosedIndex.remove(idx)
                rightChoosedIndex.insert(remainIndices[i])
                i += 1
            }

            sb = min(sb, sumLeft - sumRight)
        }
        return sb
    }
}
