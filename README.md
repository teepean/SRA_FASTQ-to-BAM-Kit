# SRA_FASTQ-to-BAM-Kit
--------------------
Script Developer: Felix Immanuel <i@fi.id.au>


Usage: Place the SRA file in current directory and pass it as a parameter to sra2bam.bat script.
Do not use relative path or absolute path but just the filename and make sure it is in the same path as the batch file script.

E.g,

C:\> sra2bam.bat to use bwa or sra2bam.bw2.bat to use bowtie2

 Syntax:
    sra2bam <sra-file> <threads>

(expects extension .sra)

E.g:

C:\> sra2bam.bat SRR1187908.sra 8
Dumping FASTQ ...
Read 13546 spots for SRR1187908.sra
Written 13546 spots for SRR1187908.sra
Creating SAM file ...
[M::main_mem] read 13546 sequences (767832 bp)...
[M::mem_process_seqs] Processed 13546 reads in 0.640 CPU sec, 0.642 real sec
[main] Version: 0.7.10-r868-dirty
[main] CMD: bin/bwa mem ref.fa SRR1187908.fastq
[main] Real time: 94.658 sec; CPU: 5.459 sec
Converting to BAM file ...
[samopen] SAM header is present: 93 sequences.
Final Cleanup ...
Done.

Similarly for fq2bam.bat file. fq2bam.bat uses bwa and fq2bam.bw2.bat uses bowtie2

C:\> fq2bam.bat 8

 Syntax:
    fq2bam <fastq-file> <threads>

(expects extension .fastq)

Note: Generated BAM files don't have @RG or read group header. However, BAM Analysis kit supports both with and without @RG tag in BAM files.
