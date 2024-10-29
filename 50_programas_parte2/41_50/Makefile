# ================================================
# Makefile para compilar y ejecutar programas Prolog
# del 41 al 50
# ================================================

# Nombre de los programas
PROGRAMS = programa41.pl programa42.pl programa43.pl programa44.pl programa45.pl \
           programa46.pl programa47.pl programa48.pl programa49.pl programa50.pl

# Enlaces de videos Asciinema
VIDEOS = "Programa 41: https://asciinema.org/a/84FwVOtUKLJuF1iFbn30KeYdR" \
         "Programa 42: https://asciinema.org/a/xC2q26KzdmiTXEGSgZuV8JAYJ" \
         "Programa 43: https://asciinema.org/a/X4nwjiNEqxqBnx5Cbaas7vnvx" \
         "Programa 44: https://asciinema.org/a/oL7NryVPQSZZSchNZuL5EytIg" \
         "Programa 45: https://asciinema.org/a/D3IndXkO18VPidE01ISUuGXo3" \
         "Programa 46: https://asciinema.org/a/5775OHwU38pbhnGscLxPxl1ea" \
         "Programa 47: https://asciinema.org/a/aqebrz44o70YTcwE5yNUmHyJT" \
         "Programa 48: https://asciinema.org/a/7gIJjp2bHe608btRrDjwZWVkU" \
         "Programa 49: https://asciinema.org/a/bupbmltKnboDlznXglChKUbGM" \
         "Programa 50: https://asciinema.org/a/JTdp2FEzPuwX6c0Qn4yF6qAFU"

# Comando para ejecutar Prolog
PROLOG = swipl

# Objetivos por defecto
all: run_all show_videos

# Regla para ejecutar todos los programas
run_all: $(PROGRAMS)
	@echo "Ejecutando todos los programas Prolog..."
	@for program in $(PROGRAMS); do \
		echo "Ejecutando $$program:"; \
		$(PROLOG) -s $$program -g true -t halt; \
	done

# Regla para mostrar los videos de Asciinema
show_videos:
	@echo "Enlaces de videos de Asciinema:"
	@for video in $(VIDEOS); do \
		echo $$video; \
	done

# Regla para limpiar archivos generados (si es necesario)
clean:
	@echo "Limpiando archivos generados..."

.PHONY: all run_all show_videos clean
