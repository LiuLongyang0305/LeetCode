// https://leetcode.com/problems/design-browser-history/
class BrowserHistory {
    private var urlLists = [String]()
    private var currentPosition = -1
    init(_ homepage: String) {
        urlLists.append(homepage)
        currentPosition = 0
    }
    
    func visit(_ url: String) {
        if currentPosition == urlLists.count - 1 {
            urlLists.append(url)
        } else {
            urlLists[(currentPosition + 1)...] = [url]
        }
        currentPosition = urlLists.count - 1
    }
    
    func back(_ steps: Int) -> String {
        if steps >= currentPosition  {
            currentPosition = 0
        } else {
            currentPosition = currentPosition - steps
        }
        return urlLists[currentPosition ]
    }
    
    func forward(_ steps: Int) -> String {
        let maxForwardStepos = urlLists.count  - currentPosition - 1
        if steps >= maxForwardStepos  {
            currentPosition = urlLists.count - 1
        } else {
            currentPosition += steps
        }
        return urlLists[currentPosition]
    }
}



/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */