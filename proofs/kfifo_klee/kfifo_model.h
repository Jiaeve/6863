#ifndef KFIFO_MODEL_H
#define KFIFO_MODEL_H

struct kfifo {
    unsigned char *buffer;
    unsigned int size;
    unsigned int in;
    unsigned int out;
};

void kfifo_init(struct kfifo *fifo,
                unsigned char *buffer,
                unsigned int size);

unsigned int kfifo_len(struct kfifo *fifo);

unsigned int kfifo_put(struct kfifo *fifo,
                       const unsigned char *buf,
                       unsigned int len);

unsigned int kfifo_get(struct kfifo *fifo,
                       unsigned char *buf,
                       unsigned int len);

#endif
