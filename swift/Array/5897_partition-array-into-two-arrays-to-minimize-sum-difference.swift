// https://leetcode.com/problems/partition-array-into-two-arrays-to-minimize-sum-difference/
class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {
        let N = nums.count >> 1
        let total = nums.reduce(0) {$0 + $1}
        
        var left = [[Int]](repeating: [], count:  N + 1)
        var right = [[Int]](repeating: [], count: N + 1)
        
        for mask in 0..<(1 << N) {
            
            var l = 0
            var r = 0
            var cnt = 0
            for bit in 0..<N {
                if(mask & (1 << bit) != 0) {
                    l += nums[bit]
                    r += nums[N + bit]
                    cnt += 1
                }
            }
            
            left[cnt].append(l)
            right[cnt].append(r)
        }
        
        //        print(left)
        //        print(right)
        
        for i in 0...N {
            right[i].sort()
        }
        
        
        
        func  getFirstElementGreaterThan(_ val: Int,in arr: [Int]) -> Int? {
            guard val <= arr.last! else {
                return nil
            }
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if arr[mid] >= val {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }
        func getLastElementLessThan(_ val: Int, in arr: [Int]) -> Int? {
            guard val >= arr[0] else {
                return nil
            }
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if arr[mid] <= val {
                    l = mid
                } else {
                    r = mid -  1
                }
            }
            return l
        }
        //枚举左侧
        
        //        print(total)
        var ans = min(abs(total - 2 * left[N][0]), abs(total - 2 * right[N][0]))
        
        for c in 1..<N{
            for ls in left[c] {
                let target = total / 2 - ls
                
                if let t = getLastElementLessThan(target, in: right[N - c]) {
                    //                    print("1   terget = \(target)  t = \(t)")
                    ans = min(ans, abs(total - 2 * (ls + right[N - c][t])))
                    if t > 0 {
                       ans = min(ans, abs(total - 2 * (ls + right[N - c][t - 1])))
                    }
                } else {
                    if let t = getFirstElementGreaterThan(target, in: right[N - c]) {
                        //                    print("2   terget = \(target)  t = \(t)")
                        ans = min(ans, abs(total - 2 * (ls + right[N - c][t])))
                    }
                }
            }
            
        }
        
        
        return ans
    }
    
}

class Solution1 {
    func minimumDifference(_ nums: [Int]) -> Int {
        let N = nums.count >> 1
        let total = nums.reduce(0) {$0 + $1}
        
        var left = [[Int]](repeating: [], count:  N + 1)
        var right = [[Int]](repeating: [], count: N + 1)
        
        for mask in 0..<(1 << N) {
            
            var l = 0
            var r = 0
            var cnt = 0
            for bit in 0..<N {
                if(mask & (1 << bit) != 0) {
                    l += nums[bit]
                    r += nums[N + bit]
                    cnt += 1
                }
            }
            
            left[cnt].append(l)
            right[cnt].append(r)
        }
        
        //        print(left)
        //        print(right)
        
        for i in 0...N {
            right[i].sort()
        }
        
        

        func  getFirstElementGreaterThan(_ val: Int,in arr: [Int]) -> Int? {
            guard val <= arr.last! else {
                return nil
            }
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if arr[mid] >= val {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return arr[l]
        }
        func getLastElementLessThan(_ val: Int, in arr: [Int]) -> Int? {
            guard val >= arr[0] else {
                return nil
            }
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if arr[mid] <= val {
                    l = mid
                } else {
                    r = mid -  1
                }
            }
            return arr[l]
        }
        //枚举左侧

//        print(total)
        var ans = min(abs(total - 2 * left[N][0]), abs(total - 2 * right[N][0]))

        for c in 1..<N{
            for ls in left[c] {
                let target = total / 2 - ls
                
                if let t = getLastElementLessThan(target, in: right[N - c]) {
//                    print("1   terget = \(target)  t = \(t)")
                    ans = min(ans, abs(total - 2 * (ls + t)))
                }
                if let t = getFirstElementGreaterThan(target, in: right[N - c]) {
//                    print("2   terget = \(target)  t = \(t)")
                    ans = min(ans, abs(total - 2 * (ls + t)))
                }
            }
            
        }
        
        
        return ans
    }
    
}