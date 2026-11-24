// https://leetcode.cn/problems/minimum-set-bits-in-a-valid-integer/
class Solution {
    func minSetBits(_ nums: [Int], _ k: Int) -> Int {
        var counter = [Int](repeating: 0, count: 18)
        var preffix = [[Int]]()
        preffix.append(counter)
        for num in nums {
            for bit in 0..<18 {
                if num & (1 << bit) > 0 {
                    counter[bit] += 1
                }
            }
            preffix.append(counter)
        }
        var addValues = [Int]()
        for idx in (k - 1)..<nums.count {
            let leftIdx = idx - k + 1
            var num = 0
            for bit in 0..<18 {
                if preffix[idx + 1][bit] - preffix[leftIdx][bit] == k {
                    num |= (1 << bit)
                }
            }

            guard num != 0 else {
                return -1
            }
            addValues.append(num)
        }

        addValues = [Int](Set<Int>(addValues))
        var ans = addValues.reduce(0) { $0 | $1}
        let subMasks = enumerateSubmasks(ans)
        if debug {
            print("subMasks = \(subMasks)")
        }

        func checkMask(_ mask: Int) -> Bool {
            for v in addValues {
                guard v & mask != 0 else {return false}
            }
            return true
        }
        func check(_ oneBitCnt: Int) -> Bool {
            let masks = subMasks[oneBitCnt]!
            for mask in masks {
                guard !checkMask(mask) else {
                    return true
                }
            }
            return false
        }

        var l = 1
        var r = subMasks.keys.max()!
        guard r > l else {
            return ans.nonzeroBitCount
        }

        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }

    private  func enumerateSubmasks(_ x: Int) -> [Int:[Int]] {
        var ans = [Int:[Int]]()
        var sub = x
        while sub > 0 {
            ans[sub.nonzeroBitCount,default: []].append(sub)
            sub = (sub - 1) & x
        }
        return ans
    }
}
