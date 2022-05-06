// https://www.acwing.com/problem/content/804/
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;

int addCnt,queryCnt;
const int N = 30010;
int a[N],preffix[N];

vector<int> alls;
vector<PII> add,query;

size_t find(int x) {
    size_t l = 0,r = alls.size() - 1;
    while (l < r) {
        size_t mid = (l + r) >> 1;
        if(alls[mid] >= x) {
            r = mid;
        } else {
            l = mid + 1;
        }
    }
    return r + 1;
}



void test() {

    cin >> addCnt >> queryCnt;
    while (addCnt--) {
        int pos,delta;
        cin >> pos >> delta;
        add.push_back({pos,delta});
        alls.push_back(pos);
    }

    while (queryCnt--) {
        int l,r;
        cin >> l >> r;
        query.push_back({l,r});
        alls.push_back(l);
        alls.push_back(r);
    }
    sort(alls.begin(),alls.end());
    alls.erase(unique(alls.begin(), alls.end()), alls.end());
    for(auto item: add) {
        size_t idx = find(item.first);
        a[idx] += item.second;
    }
    for (size_t i = 1; i <= alls.size(); i ++) {
        preffix[i] = preffix[i - 1] + a[i];
    }
    for(auto q: query) {
        size_t l = find(q.first),r = find(q.second);
        cout << preffix[r] - preffix[l - 1] << endl;
    }
}
int main(int argc, const char * argv[]) {
    // insert code here...
    test();
    return 0;
}

