//https://leetcode.cn/problems/subsequence-sum-after-capping-elements/
    class Solution {
        func subsequenceSumAfterCapping(_ nums: [Int], _ k: Int) -> [Bool] {

            var set = BitSet()
            set.insert(0)

            let sortedNums = nums.sorted()
            let N = nums.count
    //        print("\(sortedNums)  N = \(N)")
            var sb = [Bool]()
            var idx = 0
            for x in 1...nums.count {
                while idx < N && sortedNums[idx] < x{
                    var newSet = BitSet()
                    set.forEach {
                        if $0 + sortedNums[idx] <= k {
                            newSet.insert($0 + sortedNums[idx])
                        }
                    }
                    set.formUnion(newSet)
                    idx += 1
                }
                //最直接
                if set.contains(k) {
                    sb.append(true)
                    break
                }


                let maxCntOfX = N - idx
                let maxXCanbeChoosed = min(maxCntOfX,k / x)

                guard maxXCanbeChoosed > 0 else {
                    sb.append(false)
                    continue
                }
                sb.append(check(set, maxXCanbeChoosed, x, k))
            }
            if sb.count < N {
                sb += [Bool](repeating: true, count: N - sb.count)
            }
            return sb
        }


        private func check(_ set: BitSet, _ maxXCanBeChoosed: Int, _ x: Int, _ target: Int) -> Bool {

            return set.count < maxXCanBeChoosed ? check1(set, maxXCanBeChoosed, x, target) : check2(set, maxXCanBeChoosed, x, target)
        }
        private func check1(_ set: BitSet, _ maxXCanBeChoosed: Int, _ x: Int, _ target: Int) -> Bool {


            for existed in set {
                guard (target - existed) % x == 0 else {continue}
                if (target - existed) / x <= maxXCanBeChoosed {
                    return true
                }
            }

            return false
        }
        private func check2(_ set: BitSet, _ maxXCanBeChoosed: Int, _ x: Int, _ target: Int) -> Bool {
            for k in 1...maxXCanBeChoosed {
                if set.contains(target - k * x) {
                    return true
                }
            }
            return false
        }
    }
