//https://leetcode.com/problems/max-consecutive-ones-iii/
class Solution1 {
//    typealias Count = (zero:Int, one: Int)
    typealias Indices = (start:Int,end: Int)
    
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var map = [Int:Indices]()
        map[0] = (-1,-1)
        var zerosCount = 0
        var onesCount = 0
        for i in 0..<A.count {
            if A[i]  == 0 {
                zerosCount += 1
            } else {
                onesCount += 1
            }
            if  nil == map[zerosCount] {
                map[zerosCount] = (i,i)
            } else {
                map[zerosCount]?.end = i
            }
        }
        
        guard  zerosCount != A.count else {
            return K
        }
        guard K < zerosCount else {
            return A.count
        }
        
        var  ans = Int.min
        var i = K
        while i <= zerosCount {
            if let (_,end1) = map[i] {
                if let  (start2,_) = map[i - K] {
                    ans = max(ans, end1 - start2)
                }
            }
            i += 1
        }
        return ans
    }
}

class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var ans = Int.min
        var countZeros = 0
        var left = 0
        var right = 0
        while right < A.count {
            if A[right] == 0 {
                countZeros += 1
            }
            while countZeros > K {
                if  A[left] == 0 {
                    countZeros -= 1
                }
                left  += 1
            }
            ans = max(ans, right  - left + 1)
            right += 1
        }
        return ans
    }
}

class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        let N = A.count
        var preffix = [0]
        for num in A {
            preffix.append( preffix.last! + (1 - num) )
        }
        guard K < preffix.last! else {
            return N
        }
        
        func binarySearch(_ target: Int) -> Int{
            var low = 0
            var high = N
            while low < high {
                let mid = low + (high - low) / 2
                if preffix[mid] < target {
                    low =  mid + 1
                } else {
                    high = mid
                }
            }
            return low
        }
        var ans = 0
        for endIdx in 0..<N {
            let startIdx = binarySearch(preffix[endIdx + 1] - K)
            ans = max(ans, endIdx - startIdx + 1)
        }
        return ans
    }
     
}