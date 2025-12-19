#include <assert.h>
#include <klee/klee.h>
#include "kfifo_model.h"
#include <klee/klee.h>
#include <assert.h>

#define CAPACITY 8

int main() {
    struct kfifo fifo;
    unsigned char buffer[CAPACITY];

    kfifo_init(&fifo, buffer, CAPACITY);

    unsigned char a, b;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");

    int r1 = kfifo_put(&fifo, &a, 1);
    int r2 = kfifo_put(&fifo, &b, 1);

    if (r1 == 1 && r2 == 1) {
        unsigned char out1, out2;

        int g1 = kfifo_get(&fifo, &out1, 1);
        int g2 = kfifo_get(&fifo, &out2, 1);

        if (g1 == 1 && g2 == 1) {
            assert(out1 == a);
            assert(out2 == b);
        }
    }

    return 0;
}
