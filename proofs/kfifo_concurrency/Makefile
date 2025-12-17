# Unique identifier for this proof
PROOF_UID = kfifo_concurrency

# Harness file
HARNESS_FILE = kfifo_con_harness.c

# The harness itself is the CBMC target
PROOF_TARGET = $(HARNESS_FILE)

# Project source files to verify
PROJECT_SOURCES = ../../sources/kfifo.c

# Include directories (Linux headers)
PROJECT_INCLUDES = -I../../include

# Enable basic CBMC safety checks
CBMCFLAGS += --bounds-check

# Include common starter-kit rules
include ../Makefile.common
