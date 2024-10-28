# ================================================
# Makefile para los programas de Prolog del 1 al 30
# ================================================

# Nombre de los archivos de Prolog
PROGRAMAS = programa1.pl programa2.pl programa3.pl programa4.pl programa5.pl \
            programa6.pl programa7.pl programa8.pl programa9.pl programa10.pl \
            programa11.pl programa12.pl programa13.pl programa14.pl programa15.pl \
            programa16.pl programa17.pl programa18.pl programa19.pl programa20.pl \
            programa21.pl programa22.pl programa23.pl programa24.pl programa25.pl \
            programa26.pl programa27.pl programa28.pl programa29.pl programa30.pl

# Objetivos por defecto
all: run

# Regla para compilar y ejecutar todos los programas
run: $(PROGRAMAS)
	@echo "Ejecutando todos los programas..."
	@for prog in $(PROGRAMAS); do \
		echo "Ejecutando $$prog:"; \
		swipl -s $$prog -g "halt."; \
	done

# Regla para limpiar archivos generados
clean:
	@echo "Limpiando archivos generados..."
	# Aquí puedes agregar cualquier comando para limpiar archivos si es necesario.

.PHONY: all run clean
