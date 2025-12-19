#include "kfifo_model.h"
#include <string.h>

void kfifo_init(struct kfifo *fifo, unsigned char *buffer, unsigned int size) {
    fifo->buffer = buffer;
    fifo->size = size;
    fifo->in = 0;
    fifo->out = 0;
}

unsigned int kfifo_len(struct kfifo *fifo) {
    return fifo->in - fifo->out;
}

unsigned int kfifo_put(struct kfifo *fifo, const unsigned char *buf, unsigned int len) {
    if (kfifo_len(fifo) + len > fifo->size)
        return 0;

    for (unsigned int i = 0; i < len; i++) {
        fifo->buffer[(fifo->in + i) % fifo->size] = buf[i];
    }
    fifo->in += len;
    return len;
}

unsigned int kfifo_get(struct kfifo *fifo, unsigned char *buf, unsigned int len) {
    if (kfifo_len(fifo) < len)
        return 0;

    for (unsigned int i = 0; i < len; i++) {
        buf[i] = fifo->buffer[(fifo->out + i) % fifo->size];
    }
    fifo->out += len;
    return len;
}
