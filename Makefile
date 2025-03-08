# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: results/horse_pop_plot_largest_sd.png \
	results/horse_pops_plot.png \
	results/horses_spread.csv \
	reports/qmd_example.pdf \
	docs/index.html



# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir="data/00030067-eng.csv" \
		--out_dir="results"


reports/qmd_example.pdf: results reports/qmd_example.qmd
	quarto render reports/qmd_example.qmd --to pdf

docs/index.html: results reports/qmd_example.qmd
	quarto render reports/qmd_example.qmd --to html
	mv reports/qmd_example.html docs/index.html

# clean
clean:
	rm -rf results
	rm -rf reports/qmd_example.pdf \
	reports/qmd_example_files
	rm -rf index.html
