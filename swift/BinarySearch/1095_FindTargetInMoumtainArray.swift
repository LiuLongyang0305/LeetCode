 //  https://leetcode.com/problems/find-in-mountain-array/
 /**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */

class Solution {
    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        func onCountLessThanOneHundred(_ cnt: Int) -> Int {
            for i in 0..<cnt {
                if mountainArr.get(i) == target {
                    return i
                }
            }
            return -1
        }
        
        func onCountMoreThanOneHundred(_ cnt: Int) -> Int {
            var map = [Int:Int]()
            
            func binarySearchPeek(_ cnt: Int) -> Int {
                var left = 0
                var right = cnt - 1
                while left < right {
                    let mid = left + (right - left) >> 1
                    var midVal = -1
                    var leftVal = -1
                    var rightVal = -1
                    if let v = map[mid] {
                        midVal = v
                    } else {
                        midVal = mountainArr.get(mid)
                        map[mid] = midVal
                    }
                    if let v = map[mid - 1] {
                        leftVal = v
                    } else {
                        leftVal = mountainArr.get(mid - 1)
                        map[mid - 1] = leftVal
                    }
                    if let v = map[mid + 1] {
                        rightVal = v
                    } else {
                        rightVal = mountainArr.get(mid + 1)
                        map[mid + 1] = rightVal
                    }
                    
                    if midVal > leftVal && midVal > rightVal {
                        return mid
                    }
                    
                    if midVal > leftVal && midVal < rightVal {
                        left = mid + 1
                    } else if midVal < leftVal && midVal > rightVal {
                        right = mid - 1
                    }
                    
                }
                
                return left
            }
            let peekIndex = binarySearchPeek(cnt)
            let maxValue = mountainArr.get(peekIndex)
            let minValue = min(mountainArr.get(0), mountainArr.get(cnt - 1))
            guard target <= maxValue && target >= minValue  else {
                return -1
            }
            
            func binarySearch(_ left: Int, _ right: Int) -> Int? {
                var l = left
                var r = right
                while l < right {
                    let mid = l + (r - l) >> 1
                    let midVal = map[mid] ?? mountainArr.get(mid)
                    guard midVal != target else {
                        return mid
                    }
                    if midVal < target {
                        if left == 0 {
                            l = mid + 1
                        } else {
                            r = mid - 1
                        }
                    } else {
                        if left == 0 {
                            r = mid - 1
                        } else {
                            l = mid + 1
                        }
                    }
                }
                return mountainArr.get(l) == target ? l : nil
            }
            if let index = binarySearch(0, peekIndex) {
                return index
            }
            if let index = binarySearch(peekIndex, cnt - 1) {
                return index
            }
            return -1
        }
        
        let length = mountainArr.length()
        guard length > 100 else {
            return onCountLessThanOneHundred(length)
        }
        return onCountMoreThanOneHundred(length)
    }
}
