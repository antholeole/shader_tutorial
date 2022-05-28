CC=glslc
FLAGS=--target-env=opengl -fshader-stage=fragment
SOURCES = $(wildcard shaders/*.glsl)
OUTS = $(SOURCES:shaders/%.glsl=assets/shaders/%.sprv)

all: $(OUTS)

$(OUTS): $(SOURCES)
	$(CC) $(FLAGS) -o $@ $(@:assets/shaders/%.sprv=shaders/%.glsl)

