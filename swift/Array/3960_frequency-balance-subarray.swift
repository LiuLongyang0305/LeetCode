//https://leetcode.cn/problems/frequency-balance-subarray/
class Solution {
    func getLength(_ nums: [Int]) -> Int {
        if Set(nums).count == nums.count {return 1}
        var sb = getMaxLengthOfSameNum(nums)
        var preffix:[[Int:Int]] = [[:]]
        var cur = [Int:Int]()
        for num in nums {
            cur[num,default: 0] += 1
            preffix.append(cur)
        }


        for len in stride(from: nums.count, to: 1, by: -1) {
            if check(len, preffix) {
                sb = max(sb,len)
                break
            }
        }
        return sb
    }
    private func getMaxLengthOfSameNum(_ nums: [Int]) -> Int {
        var cnt = [Int](repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                cnt[i] += cnt[i - 1]
            }
        }
        return cnt.max()!
    }

    private func check(_ len: Int, _ preffix: [[Int:Int]]) -> Bool {

        func check(_ l: Int, _ r: Int) -> Bool {
            var subArrCnt = [Int:Int]()
            for (num,cnt) in preffix[r + 1] {
                let newC = cnt - (preffix[l][num] ?? 0)
                if newC > 0 {
                    subArrCnt[num] = newC
                }
            }

            if subArrCnt.count == 1 {
                return true
            }

            let setValues = Set<Int>(subArrCnt.values)
            guard setValues.count == 2 else {return false}
            return setValues.max()! / setValues.min()! == 2
        }

        var left = 0
        while left < preffix.count - 1 {
            let right = left + len - 1
            guard right < preffix.count - 1 else {break}
            if check(left, right) {return true}
            left += 1
        }
        return false
    }

}
