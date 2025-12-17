#include <assert.h>
#include "kfifo_cbmc.h"

/* CBMC nondet */
unsigned char nondet_uchar(void);
unsigned int nondet_uint(void);

/* Small FIFO for bounded model checking */
DEFINE_KFIFO(test_fifo, unsigned char, 4);

/*
 * Ghost model: a reference FIFO that records what *should* come out.
 * We verify: if kfifo_out returns 1, the byte equals the ghost-front byte.
 */
static unsigned char ghost[4];
static unsigned int ghost_in = 0;
static unsigned int ghost_out = 0;

static unsigned int ghost_len(void) {
  return ghost_in - ghost_out;
}

static void ghost_push(unsigned char x) {
  /* only call when not full */
  ghost[ghost_in % 4] = x;
  ghost_in++;
}

static unsigned char ghost_pop(void) {
  /* only call when not empty */
  unsigned char x = ghost[ghost_out % 4];
  ghost_out++;
  return x;
}

int main(void) {
  unsigned int steps = nondet_uint();
  __CPROVER_assume(steps <= 8);

  for (unsigned int i = 0; i < steps; i++) {
    unsigned int choice = nondet_uint();
    __CPROVER_assume(choice <= 1);

    if (choice == 0) {
      /* Producer step: attempt enqueue 1 byte */
      unsigned char x = nondet_uchar();

      unsigned int fifo_len_before = kfifo_len(&test_fifo);
      unsigned int ghost_len_before = ghost_len();

      unsigned int r = kfifo_in(&test_fifo, &x, 1);

      /* Return value spec for this harness: either 0 or 1 */
      assert(r == 0 || r == 1);

      if (r == 1) {
        /* Postcondition: successful enqueue increases length by 1 */
        assert(kfifo_len(&test_fifo) == fifo_len_before + 1);

        /* Ghost model must also accept one element (not full) */
        assert(ghost_len_before < 4);
        ghost_push(x);
      } else {
        /* If enqueue failed, length must stay the same */
        assert(kfifo_len(&test_fifo) == fifo_len_before);
      }

    } else {
      /* Consumer step: attempt dequeue 1 byte */
      unsigned char y = 0;

      unsigned int fifo_len_before = kfifo_len(&test_fifo);
      unsigned int ghost_len_before = ghost_len();

      unsigned int r = kfifo_out(&test_fifo, &y, 1);

      /* Return value spec for this harness: either 0 or 1 */
      assert(r == 0 || r == 1);

      if (r == 1) {
        /* Postcondition: successful dequeue decreases length by 1 */
        assert(kfifo_len(&test_fifo) == fifo_len_before - 1);

        /* Call-site postcondition: returned byte must equal FIFO-front */
        assert(ghost_len_before > 0);
        unsigned char expected = ghost_pop();
        assert(y == expected);
      } else {
        /* If dequeue failed, length must stay the same */
        assert(kfifo_len(&test_fifo) == fifo_len_before);
      }
    }

    /* Global invariant: ghost length matches concrete FIFO length */
    assert(kfifo_len(&test_fifo) == ghost_len());

    /* Basic capacity invariant */
    assert(kfifo_len(&test_fifo) <= kfifo_size(&test_fifo));
  }

  return 0;
}
