# Hashmap Makefile

CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -ldl

# Files
# CORE = main.c baseer_core.c
CORE = hashmap.c
EXT1 = math.c

TARGET = hashmap
EXT1_SO = math.so


# Default target: build executable and extensions
# all: $(TARGET) $(EXT1_SO) $(EXT2_SO)
all: $(TARGET) $(EXT1_SO)

# Build core executable
$(TARGET): $(CORE)
	$(CC) $(CFLAGS) $(CORE) -o $(TARGET) $(LDFLAGS)


# $(TARGET): $(CORE) baseer.h
# 	$(CC) $(CORE) -o $(TARGET)

# Build dynamic extension 1
$(EXT1_SO): $(EXT1)
	$(CC) $(CFLAGS) -shared $(EXT1) -o $(EXT1_SO)

# Build dynamic extension 2
# $(EXT2_SO): $(EXT2)
# 	$(CC) $(CFLAGS) -shared $(EXT2) -o $(EXT2_SO)

# Clean generated files
clean:
	rm -f $(TARGET) $(EXT1_SO)
	# rm -f $(TARGET) 


# gcc -fPIC -shared print_ext.c -o print_ext.so
