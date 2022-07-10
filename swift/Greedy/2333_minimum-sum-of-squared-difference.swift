// https://leetcode.com/problems/minimum-sum-of-squared-difference/
class Solution {

    func minSumSquareDiff(_ nums1: [Int], _ nums2: [Int], _ k1: Int, _ k2: Int) -> Int {


        //处理差的绝对值
        let N = nums1.count
        var map = [0:0]
        for i in 0..<N {
            let d = abs(nums1[i] - nums2[i])
            map[d,default: 0] += 1
        }
        //如果所有差的绝对值都是0，则不需要操作
        guard map.count > 1 else {return 0}

        let sortedMap = map.sorted { p1, p2 in
            p1.key > p2.key
        }

        //如果没有操作空间，直接返回原始结果
        let maxOpeCnt = k1 + k2
        guard maxOpeCnt > 0 else {
            return sortedMap.reduce(0) { $0 + $1.value * $1.key * $1.key}
        }


        //处理两个前前缀：数量以及变换成当前数字所需操作
        let M = sortedMap.count
        var preffixCnt  = [0]
        for (_,c) in sortedMap {
            preffixCnt.append(preffixCnt.last! + c)
        }
        var preffixNeed = [0,0]
        for i in 1..<M {
            preffixNeed.append(preffixNeed.last! + preffixCnt[i] * (sortedMap[i - 1].key - sortedMap[i].key))
        }
        guard preffixNeed.last! > maxOpeCnt else {
            return 0
        }



        //可以二分加速
        let idx = preffixNeed.lastIndex { $0 <= maxOpeCnt} ?? 0

        //处理发生改变的差的绝对值纸盒
        let remain = maxOpeCnt - preffixNeed[idx]
        let p = remain / preffixCnt[idx]
        let q = remain - p * preffixCnt[idx]
        let curV = sortedMap[idx - 1].key - p
        var ans = (preffixCnt[idx] - q) * curV * curV + q * (curV - 1) * (curV - 1)
        //处理没有发生改变的差的绝对值
        for i in idx..<M {
            ans += sortedMap[i].value * sortedMap[i].key * sortedMap[i].key
        }
        return ans
    }
}