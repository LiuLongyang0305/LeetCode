class Q219_Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = Dictionary<Int,Set<Int>>()
        for i in 0..<nums.count {
            if nil == dic[nums[i]] {
                dic[nums[i]] = Set<Int>()
            } else {
                for j in dic[nums[i]]! {
                    if i - j <= k {
                        return true
                    }
                }
            }
            dic[nums[i]]?.insert(i)
        }
        return false
    }
}