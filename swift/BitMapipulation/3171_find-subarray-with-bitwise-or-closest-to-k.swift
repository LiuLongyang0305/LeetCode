    // https://leetcode.cn/problems/find-subarray-with-bitwise-or-closest-to-k/
    class Solution {
        private let INF = 1_000_000_000_7
        func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
            //直接选[k]做子数组
            if let _ = nums.firstIndex(of: k) {return 0}

            var counter = [Int](repeating: 0, count: 32)
            var preffix = [counter]
            let M = nums.count
            var maxTotalOr = 0
            for num in nums {
                for bit in 0..<32 {
                    if (num >> bit) & 1 == 1 {
                        counter[bit] += 1
                    }
                }
                preffix.append(counter)
                maxTotalOr = maxTotalOr | num
            }


            func getOrValBeTween(_ left:Int, _ right: Int) -> Int {
                let (c1,c2) = (preffix[left],preffix[right + 1])
                var sb = 0
                for bit in 0..<32 {
                    let remainBitCnt = c2[bit] - c1[bit]
                    if remainBitCnt > 0 {
                        sb = sb | (1 << bit)
                    }
                }
                return sb
            }


            func getFirstLargeThanOrEqualTo(_ sIdx: Int) -> Int? {
                let maxOrVal = getOrValBeTween(sIdx, M - 1)
                guard maxOrVal >= k else {return nil}
                if maxOrVal == k {return k}
                if nums[sIdx] >= k {
                    return nums[sIdx]
                }
                var l = sIdx
                var r = M - 1

                while l < r {
                    let mid = (l + r) >> 1
                    let orVal = getOrValBeTween(sIdx, mid)
                    if orVal < k {
                        l = mid + 1
                    } else {
                        r = mid
                    }
                }

                return getOrValBeTween(sIdx, l)
            }


            func getLastSmllerThan(_ sIdx:Int) -> Int? {
                guard nums[sIdx] <= k else {return nil}
                guard nums[sIdx] < k else {return nums[sIdx]}
                let maxOrVal = getOrValBeTween(sIdx, M - 1)
                guard maxOrVal > k else {
                    return maxOrVal
                }
                var l = sIdx
                var r = M - 1

                while l < r {
                    let mid = (l + r + 1) >> 1
                    let orVal = getOrValBeTween(sIdx, mid)
                    if orVal < k {
                        l = mid
                    } else {
                        r = mid - 1
                    }
                }
                return  getOrValBeTween(sIdx, l)
            }

            func solve(_ sIdx: Int) -> Int {
                var sb = Int.max
                if let lastSmallerVal = getLastSmllerThan(sIdx) {
                    sb = min(sb,k - lastSmallerVal)
                }
                if let firstLargeThanOrEqualToVal = getFirstLargeThanOrEqualTo(sIdx) {
                    sb = min(sb,firstLargeThanOrEqualToVal - k)
                }
                return sb
            }



            var sb = abs(nums[0] - k)
            for startIdx in 0..<M {
                sb = min(sb,solve(startIdx))
            }

            return sb
        }
    }
