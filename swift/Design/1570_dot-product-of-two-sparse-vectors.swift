// https://leetcode.com/problems/dot-product-of-two-sparse-vectors/
class SparseVector {
    var sparseVector: [Int]
    init(_ nums: [Int]) {
        sparseVector = nums
    }

    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        return (0..<sparseVector.count).reduce(0) { $0 + sparseVector[$1] * vec.sparseVector[$1]}
    }
}

/**
 * Your SparseVector object will be instantiated and called as such:
 * let v1 = SparseVector(nums1)
 * let v2 = SparseVector(nums2)
 * let ans = v1.dotProduct(v2)
*/
