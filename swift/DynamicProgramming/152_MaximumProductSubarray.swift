class Q152_Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        typealias SubArrayProduct = (min:Int,max:Int)
        var result = nums[0]
        var products : SubArrayProduct = (nums[0],nums[0])
        for i in 1..<nums.count {
            let p1 = nums[i] * products.max
            let p2 = nums[i] * products.min
            products.max = max(max(p1, p2),nums[i])
            products.min = min(min(p1, p2),nums[i])
            if products.max > result {
                result = products.max
            }
        }
        return result
    }
}