//https://leetcode.com/problems/car-fleet/
 class Solution {
    struct  Car {
        var position: Int
        var costTime: Double
        init(position: Int, costTime: Double) {
            self.position = position
            self.costTime = costTime
        }
        var toString: String {
            return "car: position = \(position)   costTime = \(costTime)"
        }
    }
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let N = position.count
        var cars = [Car]()
        for i in 0..<N {
            cars.append(Car(position: position[i], costTime: Double(target - position[i]) /  Double(speed[i])))
        }
        cars.sort { (car0, car1) -> Bool in
            car0.position < car1.position
        }
        var ans = 0
        var index = N - 1
        while index > 0 {
            if cars[index].costTime < cars[index  - 1].costTime  {
                ans += 1
            } else {
                cars[index - 1].costTime = cars[index].costTime
            }
            index -= 1
        }
        return  ans + (index == 0 ? 1 : 0)
    }
 }
 let target = 12
 let pos = [10,8,0,5,3]
 let speed = [2,4,1,1,3]
 Solution().carFleet(target, pos, speed)
