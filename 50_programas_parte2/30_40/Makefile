# ================================================
# Makefile para compilar y ejecutar programas Prolog
# del 31 al 40
# ================================================

# Nombre de los programas
PROGRAMS = programa31.pl programa32.pl programa33.pl programa34.pl programa35.pl \
           programa36.pl programa37.pl programa38.pl programa39.pl programa40.pl

# Comando para ejecutar Prolog
PROLOG = swipl

# Objetivos por defecto
all: run_all

# Regla para ejecutar todos los programas
run_all: $(PROGRAMS)
	@echo "Ejecutando todos los programas Prolog..."
	@for program in $(PROGRAMS); do \
		echo "Ejecutando $$program:"; \
		$(PROLOG) -s $$program -g true -t halt; \
	done

# Enlaces a los videos de Asciinema
# programa31.pl: https://asciinema.org/a/wrK0zlJUkcTOv59soi7yZyIqM

# programa32.pl: https://asciinema.org/a/zvyIWFM6Ki3dTLeHGnE7dUK4B

# programa33.pl: https://asciinema.org/a/K4iguOoo3AGcMnpPVKvz513Wf

# programa34.pl: https://asciinema.org/a/2hIPkyGZextRgI8oRadd6vLPP

# programa35.pl: https://asciinema.org/a/jjRQhVj3njleGC9N7cuGjHLxp

# programa36.pl: https://asciinema.org/a/phlA7lu8kc5mvxcOlwOuyK8kU

# programa37.pl: https://asciinema.org/a/XbY98yNp3vE0TTWDtFnOhbBbu

# programa38.pl: https://asciinema.org/a/HommBToGYttGYiXBM4utNTx0x

# programa39.pl: https://asciinema.org/a/mKO0J4Y2SSQAptmqnvMggtFvm

# programa40.pl: https://asciinema.org/a/oCmW12oC9hyGF5rEUytpfWxen

# Regla para limpiar archivos generados (si es necesario)
clean:
	@echo "Limpiando archivos generados..."

.PHONY: all run_all clean
