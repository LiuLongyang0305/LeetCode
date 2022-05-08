// https://www.acwing.com/problem/content/description/246/
#include <iostream>
using namespace std;
typedef long long LL;
typedef pair<int, int> PII;

const int N = 500005;
struct Node {
    int left,right;
    int sum,lmax,rmax,tmax;
} segmentTree[N * 3];

int arrSize;
int opeCnt;
int values[N];


void pushup(Node &p, Node l,Node r) {
    p.sum = l.sum + r.sum;
    p.lmax = max(l.lmax,l.sum + r.lmax);
    p.rmax = max(r.rmax,r.sum + l.rmax);
    p.tmax = max(max(l.tmax,r.tmax),l.rmax + r.lmax);
}

void pushup(int node) {
    pushup(segmentTree[node],segmentTree[node << 1],segmentTree[node << 1 | 1]);
}


void build(int p,int l,int r) {
    if(l == r)
        segmentTree[p] = {l,r,values[r],values[r],values[r],values[r]};
    else {
        segmentTree[p] = {l,r};
        int mid = (l + r) >> 1;
        build(p << 1, l, mid);
        build(p << 1 | 1, mid + 1, r);
        pushup(p);
    }
}


void modify(int p,int target,int val) {
    int ll = segmentTree[p].left;
    int rr = segmentTree[p].right;
    if(ll == target && rr == target )
        segmentTree[p] = {target,target,val,val,val,val};
    else {
        int mid = (ll + rr) >> 1;
        if(target <= mid)
            modify(p << 1, target, val);
        else modify(p << 1 | 1, target, val);
        pushup(p);
    }
}


Node query(int p, int l,int r) {
    int ll = segmentTree[p].left;
    int rr = segmentTree[p].right;
    if(ll == l && rr == r)
        return segmentTree[p];
    else {
        int mid = (ll + rr) >> 1;
        if(r <= mid)
            return  query(p << 1, l, r);
        else if (l > mid)
            return  query(p << 1 | 1, l, r);
        else {
            Node res;
            pushup(res, query(p << 1, l, mid), query(p << 1 | 1, mid + 1, r));
            return res;
        }
    }
}


void test() {
    scanf("%d%d",&arrSize,&opeCnt);
    for (int i = 1; i <= arrSize; i++) scanf("%d",&values[i]);
    build(1, 1, arrSize);
    int ope,x,y;
    while (opeCnt--) {
        scanf("%d%d%d",&ope,&x,&y);
        if(1 == ope) {
            if(x > y) swap(x,y);
            printf("%d\n",query(1, x, y).tmax);
        } else
            modify(1, x, y);
    }

}
int main(int argc, const char * argv[]) {
    // insert code here...
    test();
    return 0;
}

