NAME=lab2
LATEX=pdflatex
#BIBLATEX=biber
#BIBFILE=bibliografia.bib
WORKDIR=.work

.PHONY: all, clean

all: clean ${NAME}.pdf

${NAME}.pdf: ${NAME}.tex ${BIBFILE}
	@echo "\033[32;1m===== Compiling =====\033[0m"
	mkdir -p ${WORKDIR}
	#@echo "\033[34;1m===== LaTeX =====\033[0m"
	${LATEX} -output-directory=${WORKDIR} -interaction=batchmode ${NAME} || ${LATEX} -output-directory=${WORKDIR} ${NAME}
	#@echo "\033[33;1m===== Biber =====\033[0m"
	#${BIBLATEX} --output-directory ${WORKDIR} --quiet ${NAME}
	#@echo "\033[34;1m===== LaTeX =====\033[0m"
	#${LATEX} -output-directory=${WORKDIR} -interaction=batchmode ${NAME} || ${LATEX} -output-directory=${WORKDIR} ${NAME}
	mv ${WORKDIR}/${NAME}.pdf .
	@echo "\033[31;1m===== Finished =====\033[0m"

clean:
	@echo "\033[35;1m===== Cleaning  =====\033[0m"
	rm -rf ${WORKDIR}
	rm -f ${NAME}.pdf
