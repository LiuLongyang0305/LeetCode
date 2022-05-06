// https://www.acwing.com/problem/content/1277/
#include <iostream>
using namespace std;
typedef long long LL;

const int N = 200005;
struct Node {
    int left,right;
    int maxVal;
} segmentTree[N * 4];


void build(int parent,int left,int right) {
    segmentTree[parent].left = left;
    segmentTree[parent].right = right;
    if(left == right) {
        return;
    }
    int mid = (left + right) >> 1;
    build(parent << 1, left, mid);
    build(parent << 1 | 1, mid + 1, right);
}

int query(int parent, int left,int right) {
    if (segmentTree[parent].left == left && segmentTree[parent].right == right)
        return  segmentTree[parent].maxVal;

    int mid = (segmentTree[parent].left + segmentTree[parent].right) >> 1;
    if (right <= mid)
        return  query(parent << 1, left, right);
    else if (left > mid)
        return query(parent << 1 | 1, left, right);
    else
        return max(query(parent << 1, left, mid),query(parent << 1 | 1, mid + 1, right));
}

void pushup(int node) {
    segmentTree[node].maxVal = max(segmentTree[node << 1].maxVal, segmentTree[node << 1 | 1].maxVal);
}

void modify(int parent,int target, int val) {
    if(segmentTree[parent].left == segmentTree[parent].right) segmentTree[parent].maxVal = val;
    else {
        int mid = (segmentTree[parent].left + segmentTree[parent].right) >> 1;
        if(target <= mid) modify(parent << 1, target, val);
        else modify(parent << 1 | 1, target, val);
        pushup(parent);
    }
}
int opeCnt;
int mod;
void test() {

    int n = 0;
    int last = 0;
    cin >> opeCnt >> mod;
    build(1, 1, opeCnt);

    while (opeCnt--) {
        char op;
        int data;
        cin >> op >> data;
        if (op == 'A') {
            modify(1, n + 1, ((LL)data + last) % mod);
            n++;
        } else {
            last = query(1, n - data + 1, n);
            cout << last << endl;
        }
    }
}
int main(int argc, const char * argv[]) {
    // insert code here...
    test();
    return 0;
}