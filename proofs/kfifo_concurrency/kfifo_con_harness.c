#include <assert.h>
#include "kfifo_cbmc.h"

unsigned char nondet_uchar(void);
unsigned int nondet_uint(void);

DEFINE_KFIFO(test_fifo, unsigned char, 8);

static void prod_step(void) {
  unsigned char x = nondet_uchar();
  (void)kfifo_in(&test_fifo, &x, 1);
}

static void cons_step(void) {
  unsigned char y;
  (void)kfifo_out(&test_fifo, &y, 1);
}

int main(void) {
  unsigned int steps = nondet_uint();
  __CPROVER_assume(steps <= 6);

  for (unsigned int i = 0; i < steps; i++) {
    unsigned int choice = nondet_uint();
    __CPROVER_assume(choice <= 1);
    if (choice == 0) prod_step();
    else cons_step();
  }

  unsigned int size = kfifo_size(&test_fifo);
  unsigned int len  = kfifo_len(&test_fifo);

  assert(len <= size);
  if (kfifo_is_full(&test_fifo))  assert(len == size);
  if (kfifo_is_empty(&test_fifo)) assert(len == 0);

  return 0;
}
