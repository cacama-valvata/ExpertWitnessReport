# Compile Expert Witness Report into PDF

# Either use natively installed pandoc or utilize container with pandoc
#    Comment out either line
#PANDOC = pandoc
PANDOC = docker run --rm -v $(shell pwd):/data detjensrobert/arch-pandoc:full
# Include all sections found in src directory
SECTS = $(sort $(wildcard src/*.md))
# Pandoc options
OPTS = -s -V geometry:margin=1in --highlight=tango

all: ExpertWitnessReport.pdf

ExpertWitnessReport.pdf:  src/*
	$(PANDOC) $(SECTS) -o ExpertWitnessReport.pdf --metadata-file src/metadata.yml $(OPTS)

clean: rm -rf ExpertWitnessReport.pdf
