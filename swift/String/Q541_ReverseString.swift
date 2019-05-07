class Q541_Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        if k < 1 {
            return s
        }
        var str = Array<Character>(s)
        let length = s.count
        if k > s.count {
            reverseElementsBetween(arr: &str, startIndex: 0, endIndex: length - 1)
        } else {
            let times = length / k
            for i in 0..<times {
                if i % 2 == 0 {
                    reverseElementsBetween(arr: &str, startIndex: k * i, endIndex: k * (i + 1) - 1)
                }
            }
            if times % 2 == 0{
                reverseElementsBetween(arr: &str, startIndex: k * times, endIndex: length - 1 )
            }
        }
        return String(str)
    }