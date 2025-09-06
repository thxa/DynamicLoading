
# Hashmap Makefile

CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -ldl

# Files
CORE = hashmap.c
EXT1 = math.c

TARGET = hashmap
EXT1_SO = modules/math.so

# Default target
all: $(TARGET) $(EXT1_SO)

# Ensure modules directory exists
modules:
	mkdir -p modules

# Build core executable
$(TARGET): $(CORE)
	$(CC) $(CFLAGS) $(CORE) -o $(TARGET) $(LDFLAGS)

# Build dynamic extension 1
$(EXT1_SO): $(EXT1) | modules
	$(CC) $(CFLAGS) -shared $(EXT1) -o $(EXT1_SO)

# Clean generated files
clean:
	rm -f $(TARGET) $(EXT1_SO)
	rm -rf modules

# gcc -fPIC -shared print_ext.c -o print_ext.so
