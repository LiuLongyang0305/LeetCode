class Solution {
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