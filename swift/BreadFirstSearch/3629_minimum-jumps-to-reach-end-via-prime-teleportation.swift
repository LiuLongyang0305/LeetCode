//https://leetcode.cn/problems/minimum-jumps-to-reach-end-via-prime-teleportation/
class Solution {
    private  static let MAXN = 1_000_000
    private var isPrime = [Bool](repeating: true, count:Solution.MAXN + 1)
    init() {
        isPrime[0] = false
        isPrime[1] = false
        var i = 2
        while i * i <= Solution.MAXN  {
            if isPrime[i] {
                var j = i * i
                while j <= Solution.MAXN {
                    isPrime[j] =  false
                    j += i
                }
            }
            i += 1
        }
    }
    func minJumps(_ nums: [Int]) -> Int {
        let N = nums.count
        guard N > 1  else {return 0}
        var primerToIndices = [Int:[Int]]()
        for i in 0..<N {
            if nums[i] <=  1 {continue}
            let factors = getPrimersList(of: nums[i])
            for fac  in factors {
                primerToIndices[fac,default: []].append(i)
            }
            if isPrime[nums[i]]  {
                primerToIndices[nums[i],default: []].append(i)
            }
        }
        // print(primerToIndices.count)

        var visited  = [Bool](repeating: false, count: N)
        var queue = [Int]()
        visited[0] = true
        queue.append(0)
        var  step =  0

        while !queue.isEmpty {
            // print(queue)
            step += 1
            var newQueue = [Int]()
            for idx in queue {
                // guard idx != N - 1 else {return step}
                if idx + 1 < N && !visited[idx + 1] {
                    if idx + 1 ==   N - 1  {return step}
                    newQueue.append(idx +  1)
                    visited[idx + 1] = true
                }
                if  idx - 1 >= 0 && !visited[idx - 1] {
                    if idx - 1 ==   N - 1  {return step}
                    visited[idx - 1] = true
                    newQueue.append(idx  - 1)
                }

                if nums[idx]  > 1  && isPrime[nums[idx]] {
                    for nextIdx in (primerToIndices[nums[idx]]  ?? []).reversed() {
                        if !visited[nextIdx] && nextIdx != idx {
                            if nextIdx == N - 1 {return step}
                            visited[nextIdx]  = true
                            newQueue.append(nextIdx)
                        }
                    }
                }

            }
            queue =  newQueue
            
        }

        return -1
    }

    private func getPrimersList(of num: Int) -> [Int]{
        guard num > 1 else {return [] }
        var temp  = num
        var  sb = [Int]()
        if temp % 2  == 0 {
            sb.append(2)
            while temp % 2 == 0 {
                temp /= 2
            }
        }
        var i = 3
        while i * i <= temp {
            if temp  % i == 0 {
                sb.append(i)
                while temp % i == 0 {
                    temp /= i
                }
            }
            i  +=  2
        }
        if  temp > 1 {
            sb.append(temp)
        }
        return sb
    }
}
