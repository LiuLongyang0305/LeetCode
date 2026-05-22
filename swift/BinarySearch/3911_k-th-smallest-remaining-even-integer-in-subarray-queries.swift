    //https://leetcode.cn/problems/k-th-smallest-remaining-even-integer-in-subarray-queries/
class Solution {
    private typealias Pair = (idx:Int, val: Int)
    func kthRemainingInteger(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        let N = nums.count
        var preffix = [Int](repeating: 0, count: N + 1)
        var preffixMax = [Int](repeating: 0, count: N + 1)
        var candidatePairs = [Pair]()
        for (i,v) in nums.enumerated() {
            if v & 1 == 0 {
                candidatePairs.append((i,v))
                preffix[i + 1] = preffix[i] + 1
                preffixMax[i + 1] = v
            } else {
                preffix[i + 1] = preffix[i]
                preffixMax[i + 1] = preffixMax[i]
            }
        }

        func binarySearchFirstLargerThan(_ target: Int) -> Int {
            //查找[L,R]里面第一个偶数即第一个大于minV的偶数
            var left = 0
            var right = candidatePairs.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if candidatePairs[mid].val > target {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return candidatePairs[left].val
        }
        //找到最后一个小于等于mid的数字

        func binarySearchLastLessThanOrEaqual(_ target: Int) -> Int {
            var left = 0
            var right = candidatePairs.count - 1
            while left < right {
                let mid = (left + right + 1) >> 1
                if candidatePairs[mid].val > target {
                    right = mid - 1
                } else {
                    left = mid
                }
            }
            // print(" mid = \(target)  \(#function)   sb = \(candidatePairs[left])")
            return candidatePairs[left].idx
        }


        func check(_ mid: Int, _ k:Int, _ leftBoud:Int) -> Bool {
            let idx = binarySearchLastLessThanOrEaqual(mid)
            let existed = preffix[idx + 1] - preffix[leftBoud]
            // print("\(#function) e = \(existed)")
            return mid / 2 - existed >= k
        }


        var sb = [Int]()
        for q in queries {
            let (l,r,k) = (q[0],q[1],q[2])
            guard preffix[r + 1] - preffix[l] > 0 else {
                sb.append(2 * k)
                continue
            }

            let maxV = preffixMax[r + 1]
            let minV = binarySearchFirstLargerThan(preffixMax[l])
            let existedValues = preffix[r + 1] - preffix[l]
            // print("maxV = \(maxV)   minV = \(minV) e = \(existedValues)")
            if (minV - 2) / 2 >= k {
                sb.append(2 * k)
            } else if maxV / 2 -  existedValues < k {
                sb.append(2 * (k + existedValues))
            } else {

                var left = minV
                var right = maxV

                while left < right {
                    var mid = (right + left) / 2
                    if check(mid, k, l) {
                        right = mid
                    } else {
                        left = mid + 1
                    }

                }
                sb.append(left)
            }

        }
        return sb
    }
}
