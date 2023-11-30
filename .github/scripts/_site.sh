#!/bin/bash

echo "Creating _site/"
mkdir _site

echo "Add time for last update: $(date +'%A, %b %d %Y, %I:%M %p')"
echo -e "\n_Last updated: $(TZ='Asia/Kolkata' date +'%A, %b %d %Y, %I:%M %p') IST_" >>".github/index.md"

echo "Compiling .github/index.md to _site/index.html"
pandoc --katex .github/index.md -s -o _site/index.html

echo "Zipping pdfs to basic_graph_theory_all_pdfs.zip"
zip -r _site/basic_graph_theory_all_pdfs.zip pdfs/*

echo "Copying pdfs to _site/pdfs"
cp -r pdfs _site/pdfs
