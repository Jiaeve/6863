#include <assert.h>
#include "kfifo_cbmc.h"

unsigned char nondet_uchar(void);

DEFINE_KFIFO(test_fifo, unsigned char, 4);

int main(void) {
  unsigned char x = nondet_uchar();
  unsigned char y;

  /* Fill FIFO */
  for (unsigned int i = 0; i < 4; i++) {
    unsigned int r = kfifo_in(&test_fifo, &x, 1);
    assert(r == 1);
  }

  /* FIFO is full */
  unsigned int in_before  = test_fifo.in;
  unsigned int out_before = test_fifo.out;

  unsigned int r_full = kfifo_in(&test_fifo, &x, 1);

  /* Error-handling properties */
  assert(r_full == 0);
  assert(test_fifo.in  == in_before);
  assert(test_fifo.out == out_before);

  /* Drain FIFO */
  for (unsigned int i = 0; i < 4; i++) {
    unsigned int r = kfifo_out(&test_fifo, &y, 1);
    assert(r == 1);
  }

  /* FIFO is empty */
  in_before  = test_fifo.in;
  out_before = test_fifo.out;

  unsigned int r_empty = kfifo_out(&test_fifo, &y, 1);

  assert(r_empty == 0);
  assert(test_fifo.in  == in_before);
  assert(test_fifo.out == out_before);

  return 0;
}
