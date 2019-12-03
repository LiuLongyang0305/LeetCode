// https://leetcode.com/problems/fizz-buzz/
class Solution {
     func fizzBuzz(_ n: Int) -> [String] {
        return (1...n).map { $0 % 15 == 0 ? "FizzBuzz" : $0 % 3 == 0 ? "Fizz" : $0  % 5 ==  0 ? "Buzz" : "\($0)"}
     }
 }