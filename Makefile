LDLIBS := $(shell llvm-config --ldflags --libs)

.PHONY: all
all: test

.PHONY: test
test: compiler.bc stage2.bc
	diff $^

%: %.bc
	clang -o $@ $< $(LDLIBS)

stage2.bc: compiler.soba compiler
	./compiler $< $@

compiler.bc: compiler.soba bootstrap
	./bootstrap $< $@
