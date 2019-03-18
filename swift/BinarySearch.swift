class Q852_Solution {
    func peakIndexInMountainArray(_ A: [Int]) -> Int {
        var right = A.count - 1
        var left = 0
        while true  {
            let middle = (right + left) / 2
            let moreThanLast = A[middle] > A[middle - 1]
            let moreThanNext =  A[middle] > A[middle + 1]
            if moreThanLast && moreThanNext {
                return middle
            }
            if moreThanLast && !moreThanNext {
                left = middle
            }
            if !moreThanLast && moreThanNext {
                right =  middle
            }
        }
    }
}

class Q167_Solution {
    var numbers : [Int] = []
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        self.numbers = numbers
        var result = [Int]()
        for i in 0...(numbers.count / 2 + 1) {
            if let index = findTarget(target: target - numbers[i],start:1) {
                result.append(i + 1)
                result.append(index + 1)
                return result
            }
        }
        return result
    }
    private func findTarget(target: Int,start: Int) -> Int? {
        let length = self.numbers.count
        guard target >= numbers[0] && target <= numbers[length - 1] else {
            return nil
        }
        var left = start
        var right = length - 1
        while left < right {
            let middle = (left + right) / 2
            if numbers[middle] == target {
                return middle
            } else if numbers[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        if left == right {
            if numbers[left] == target {
                return left
            }
        }
        return nil
    }
}

class Q704_Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let length = nums.count
        guard target >= nums[0] && target <= nums[length - 1] else {
            return -1
        }
        var left = 0
        var right = length - 1
        while left < right {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        if left == right {
            if nums[left] == target {
                return left
            }
        }
        return -1
    }
}

class Q35_Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if target <= nums[0] || nums.isEmpty {
            return 0
        }
        if target > nums.last! {
            return nums.count
        }
        var left = 0
        var right = nums.count
        while left < right - 1 {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            } else if nums[middle] < target {
                left = middle
            } else {
                right = middle
            }
        }
        return left + 1
    }
}

class Q367_Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var left = 0
        var right = num
        while left < right - 1 {
            let middle = (left + right) / 2
            let rel = middle * middle
            if rel == num {
                return true
            } else if rel > num {
                right = middle
            } else {
                left = middle
            }
        }
        if left * left == num || right * right == num {
            return true
        }
        return false
    }
}

class Q441_Solution {
    func arrangeCoins(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var low = 1
        var high = n - 1
        while low < high {
            let mid = low + (high - low) / 2
            let rel = mid * (mid + 1) / 2
            let rel2 = (mid + 1) * (mid + 2) / 2
            if rel <= n && rel2 > n {
                return mid
            } else if rel > n {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}
class Q69_Solution {
    func mySqrt(_ x: Int) -> Int {
        var low = 0
        var high = x
        while low < high {
            let mid = low + (high - low) / 2
            let powMid = mid * mid
            let powMidPlusOne = (mid + 1) * (mid) + 1
            if powMid <= x && powMidPlusOne > x {
                return mid
            } else if powMid > x {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low * low == x ? low : (low - 1)
    }
}