// https://leetcode.com/problems/the-latest-time-to-catch-a-bus/
class Solution {
    func latestTimeCatchTheBus(_ buses: [Int], _ passengers: [Int], _ capacity: Int) -> Int {
        let sortedBuses = buses.sorted()
        let sortedPassengers =  [-1] + passengers.sorted() + [10000000000]
        let N = buses.count
        let set = Set<Int>(passengers)
        //下一辆车发车时上车的第一个乘客的idx
        var last = 1

        for i in 0..<N {
            //找到本次车可以承载的乘客数量，两个限制：发车时间和车的容量
            let idx = binarySearch(sortedBuses[i], in: sortedPassengers)
            let cnt = min(capacity, idx - last + 1)
            //前N-1辆车的处理：指针后移
            if i != N - 1 {
                last = cnt + last
            } else {
                //我一定要坐上最后一班车
                var possible = cnt < capacity ? sortedBuses[i] : sortedPassengers[cnt + last - 1] - 1
                while set.contains(possible) {
                    possible -= 1
                }
                return possible
            }
        }
        return -1
    }


    private func binarySearch(_ target: Int, in arr: [Int]) -> Int {

        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if arr[mid] > target {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}