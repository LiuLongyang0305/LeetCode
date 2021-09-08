// https://leetcode.com/problems/the-number-of-good-subsets/
extension Int {
    var mask: Int {
        guard self > 1 else {
            return self == 1 ? 1 : -1
        }
        var mask = 0
        var numCopy = self
        var i = 2
        while i <= numCopy / i {
            if numCopy % i == 0 {
                guard numCopy % (i * i) != 0 else{
                    return -1
                }
                numCopy /= i
                mask |= (1 << i)
            }
            i += 1
        }
        if numCopy > 1 {
            mask |= (1 << numCopy)
        }
        return mask
    }
}

class Solution {
    
    private let mod = 1_000_000_007
    private let masks = (0...31).map({ $0.mask})

    func numberOfGoodSubsets(_ nums: [Int]) -> Int {
        
        var counter = Array<Int>(repeating: 0, count: 31)
        var maxEle = -1
        for num in nums {
            if masks[num] != -1 {
                counter[num] += 1
                maxEle = max(maxEle, num)
            }
        }
        guard maxEle > 1 else {
            return 0
        }
        //特殊处理1
        let factor = counter[1] == 0 ? 1 : (1...counter[1]).reduce(1, { r, _ in
            r * 2 % mod
        })
        //mask  ---> number
        var goodSubsetCnt = [0:1]

        for num in 2...maxEle where counter[num] > 0 && masks[num] != -1 {
            var newGoodSubsetCnt = goodSubsetCnt
            for (mask,cnt) in goodSubsetCnt where mask & masks[num] == 0 {
                let key = mask | masks[num]
                let c = newGoodSubsetCnt[key] ?? 0
                newGoodSubsetCnt[key] = (c + cnt * counter[num] % mod) % mod
            }
            goodSubsetCnt = newGoodSubsetCnt
        }

        var ans = 0
        for (mask,cnt) in goodSubsetCnt where mask > 0  {
            ans = (ans + cnt) % mod
        }
        return ans * factor % mod
    }
    
}