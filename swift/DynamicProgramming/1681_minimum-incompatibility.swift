 // https://leetcode.com/problems/minimum-incompatibility/
extension Int {
    var bitCnt: Int {
        var cnt = 0
        var a = self
        while a > 0 {
            a &= (a - 1)
            cnt += 1
        }
        return cnt
    }
}


class Solution {
    func minimumIncompatibility(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        guard N % k == 0 else {
            return -1
        }
        guard k != nums.count else {
            return 0
        }
        var counter = [Int:Int]()
        nums.forEach { counter[$0, default:0] += 1}
        guard counter.values.max()! <= k else {
            return -1
        }
        guard 1 != k else {
            return   nums.max()! - nums.min()!
        }
        
        let batchSize = N / k
        let possiblesubsets = (1..<(1 << counter.count)).filter { $0.bitCnt == batchSize}
        
        var memo = [Int:Int]()
        func dfs(_ candidate: [Int:Int]) -> Int {
            guard !candidate.isEmpty else {
                return 0
            }
            let key = candidate.hashValue
            guard memo[key] == nil else {
                return memo[key]!
            }
            let M = candidate.count
            let maxSubset = 1 << M
            var ans = Int.max
            
            let sortedCandidate = candidate.sorted { cnt1, cnt2 in
                cnt1.key < cnt2.key
            }
            
            for subSet in possiblesubsets {
                guard subSet < maxSubset else {
                    break
                }
                
                var nextCounter = candidate
                var maxV = 0
                var minV = 20
                for bit in 0..<M {
                    if subSet & (1 << bit) != 0 {
                        let (num,cnt) = sortedCandidate[bit]
                        maxV = max(maxV, num)
                        minV = min(minV, num)
                        if cnt == 1 {
                            nextCounter.removeValue(forKey: num)
                        } else {
                            nextCounter.updateValue(cnt - 1, forKey: num)
                        }
                    }
                }
                let t = dfs(nextCounter)
                guard -1 != t else {
                    continue
                }
                ans = min(ans, maxV - minV + t)
            }
            
            
            memo[key] = ans == Int.max ? -1 : ans
            return ans == Int.max ? -1 : ans
        }
        return dfs(counter)
    }
}extension Int {
    var bitCnt: Int {
        var cnt = 0
        var a = self
        while a > 0 {
            a &= (a - 1)
            cnt += 1
        }
        return cnt
    }
}


class Solution {
    func minimumIncompatibility(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        guard N % k == 0 else {
            return -1
        }
        guard k != nums.count else {
            return 0
        }
        var counter = [Int:Int]()
        nums.forEach { counter[$0, default:0] += 1}
        guard counter.values.max()! <= k else {
            return -1
        }
        guard 1 != k else {
            return   nums.max()! - nums.min()!
        }
        
        let batchSize = N / k
        let possiblesubsets = (1..<(1 << counter.count)).filter { $0.bitCnt == batchSize}
        
        var memo = [Int:Int]()
        func dfs(_ candidate: [Int:Int]) -> Int {
            guard !candidate.isEmpty else {
                return 0
            }
            let key = candidate.hashValue
            guard memo[key] == nil else {
                return memo[key]!
            }
            let M = candidate.count
            let maxSubset = 1 << M
            var ans = Int.max
            
            let sortedCandidate = candidate.sorted { cnt1, cnt2 in
                cnt1.key < cnt2.key
            }
            
            for subSet in possiblesubsets {
                guard subSet < maxSubset else {
                    break
                }
                
                var nextCounter = candidate
                var maxV = 0
                var minV = 20
                for bit in 0..<M {
                    if subSet & (1 << bit) != 0 {
                        let (num,cnt) = sortedCandidate[bit]
                        maxV = max(maxV, num)
                        minV = min(minV, num)
                        if cnt == 1 {
                            nextCounter.removeValue(forKey: num)
                        } else {
                            nextCounter.updateValue(cnt - 1, forKey: num)
                        }
                    }
                }
                let t = dfs(nextCounter)
                guard -1 != t else {
                    continue
                }
                ans = min(ans, maxV - minV + t)
            }
            
            
            memo[key] = ans == Int.max ? -1 : ans
            return ans == Int.max ? -1 : ans
        }
        return dfs(counter)
    }
}