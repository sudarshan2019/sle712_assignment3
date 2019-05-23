#!/bin/bash
echo "Hello World"
#make the blast index
formatdb -p F -o T -i Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa

#incorporate some mismatches
msbar -sequence 3.fa -count 400 -point 4 -block 0 -codon 0 -outseq mysample_mutated.fa

#run the blastn
blast2 -p blastn -e 0.001 -m8 -d Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa -i mysample_mutated.fa -i mysample_mutated.fa
