//https://leetcode.com/problems/subarrays-with-k-different-integers/
class SlidingWindow {
    private var counter = [Int:Int]()
    private var nonZero = 0
    func add(_  x: Int)  {
        if let c = counter[x] {
            counter.updateValue(c  + 1, forKey: x)
            if c == 0 {
                nonZero += 1
            }
        } else {
            nonZero += 1
            counter.updateValue(1, forKey: x)
        }
        
    }
    func remove(_ x: Int)  {
        if let c = counter[x]  {
            if c == 1 {
                nonZero  -= 1
            }
            counter.updateValue(c - 1, forKey: x)
        }
    }
    func different() -> Int {
        return nonZero
    }
}
class Solution {
    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        let window1 = SlidingWindow()
        let window2 = SlidingWindow()
        var ans = 0
        var left1 = 0
        var left2 = 0
        for right in 0..<A.count {
            let x = A[right]
            window1.add(x)
            window2.add(x)
            while window1.different() > K {
                window1.remove(A[left1])
                left1 += 1
            }
            while window2.different() >= K {
                window2.remove(A[left2])
                left2 += 1
            }
            ans += left2 - left1
        }
        return  ans
    }
}