//https://leetcode.com/problems/asteroid-collision/
class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        
        var stack = [Int]()
        for asteroid in asteroids {
            
            if stack.isEmpty || stack.last! < 0  || (stack.last! > 0 && asteroid > 0) {
                stack.append(asteroid)
                continue
            }
            
            // asteroid < 0 and last > 0, will collision
            var isDisappeared = false
            while stack.count > 0 && stack.last! > 0 {
                if -asteroid > stack.last! {
                    stack.removeLast()
                    continue
                }
                if asteroid + stack.last! == 0 {
                    stack.removeLast()
                    isDisappeared = true
                    break
                }
                isDisappeared =  true
                break
            }
            if !isDisappeared {
                stack.append(asteroid)
            }
        }
        return stack
    }
}
