#include <pthread.h>
#include <assert.h>
#include "kfifo.h"

/*
 * CBMC nondeterministic functions
 * CBMC will treat these as symbolic values
 */
unsigned char nondet_uchar(void);
unsigned int nondet_uint(void);

/*
 * Define a KFIFO with:
 *   element type: unsigned char
 *   capacity: 8
 */
DEFINE_KFIFO(test_fifo, unsigned char, 8);

/*
 * Producer thread:
 *   nondeterministically enqueue up to 2 elements
 */
void *producer(void *arg) {
    unsigned int n = nondet_uint();
    __CPROVER_assume(n <= 2);

    for (unsigned int i = 0; i < n; i++) {
        unsigned char x = nondet_uchar();
        kfifo_in(&test_fifo, &x, 1);
    }
    return NULL;
}

/*
 * Consumer thread:
 *   nondeterministically dequeue up to 2 elements
 */
void *consumer(void *arg) {
    unsigned int n = nondet_uint();
    __CPROVER_assume(n <= 2);

    for (unsigned int i = 0; i < n; i++) {
        unsigned char y;
        kfifo_out(&test_fifo, &y, 1);
    }
    return NULL;
}

int main(void) {
    pthread_t t1, t2;

    /*
     * Create producer and consumer threads
     */
    pthread_create(&t1, NULL, producer, NULL);
    pthread_create(&t2, NULL, consumer, NULL);

    /*
     * Wait for both threads to finish
     */
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    /*
     * Post-condition checks
     */
    unsigned int size = kfifo_size(&test_fifo);
    unsigned int len  = kfifo_len(&test_fifo);

    /* Length must never exceed capacity */
    assert(len <= size);

    /* Full FIFO implies len == size */
    if (kfifo_is_full(&test_fifo)) {
        assert(len == size);
    }

    /* Empty FIFO implies len == 0 */
    if (kfifo_is_empty(&test_fifo)) {
        assert(len == 0);
    }

    return 0;
}
