   //https://leetcode.cn/problems/longest-subarray-with-at-most-k-distinct-prime-factors/
    class Solution {
        private var primerFactors = [Int:Set<Int>]()
        func longestSubarray(_ nums: [Int], _ k: Int) -> Int {

            let M = nums.count
            var counter = [Int:Int]()

            var l = 0
            var sb = 0
            for r in 0..<M {
                if nil == primerFactors[nums[r]] {
                    primerFactors[nums[r]] = uniquePrimeFactors(nums[r])
                }
                for p in primerFactors[nums[r]]! {
                    counter[p,default: 0] += 1
                }
                while counter.count > k {
                    for p in primerFactors[nums[l]]! {
                        let cnt = counter[p]!
                        if cnt == 1 {
                            counter.removeValue(forKey: p)
                        } else {
                            counter[p] = cnt - 1
                        }

                    }
                    l += 1
                }
                sb = max(r - l + 1,sb)
            }
            return sb
        }

        private func uniquePrimeFactors(_ num: Int) -> Set<Int> {
            guard num > 1 else {return []}
            var sb = Set<Int>()
            var n = num
            if n % 2 == 0 {
                sb.insert(2)
                while n % 2 == 0 {
                    n /= 2
                }
            }

            var i = 3
            while i * i <= n {
                if  n % i == 0 {
                    sb.insert(i)
                    while n % i == 0 {
                        n /= i
                    }
                }
                i += 2
            }
            if n > 2 {
                sb.insert(n)
            }
            return sb
        }
    }
