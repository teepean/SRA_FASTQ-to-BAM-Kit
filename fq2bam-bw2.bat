@echo off
setlocal
set PATH=.\perl\site\bin;.\perl\bin;.\c\bin;%PATH%
title FASTQ to BAM Kit

REM     The MIT License (MIT)
REM     Copyright © 2013-2015 Felix Immanuel
REM     http://www.y-str.org
REM     
REM     Permission is hereby granted, free of charge, to any person obtaining a copy
REM     of this software and associated documentation files (the Software), to deal
REM     in the Software without restriction, including without limitation the rights
REM     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM     copies of the Software, and to permit persons to whom the Software is furnished
REM     to do so, subject to the following conditions: The above copyright notice and
REM     this permission notice shall be included in all copies or substantial portions
REM     of the Software. THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY
REM     KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
REM     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
REM     EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
REM     OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
REM     ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
REM     OTHER DEALINGS IN THE SOFTWARE.
echo.
echo            *** FQ to BAM Kit ***
echo.
echo Tools Used: samtools, cygwin, sratoolkit
echo Script Developer: Felix Immanuel ^<i@fi.id.au^>
echo.
if "%1"=="" goto NOPARAM
set FILE=%1;
echo Creating BAM file ...
bowtie2 --very-sensitive -p %THREADS% -x bw2db -U %FILE:~0,-7%.fastq | bin\samtools.exe view -@ %THREADS% -bS - > %FILE:~0,-7%.bam
echo Final Cleanup ...
REM IF EXIST %FILE:~0,-7%.fastq DEL /Q /F %FILE:~0,-7%.fastq
echo Done.
echo.
echo The BAM file can now be processed using 'BAM Analysis Kit' which can be
echo downloaded from webpage https://github.com/teepean/BAM-Analysis-Kit/releases
echo.
goto END
:NOPARAM
echo  Syntax:
echo     fq2bam ^<fastq-file^> ^<threads^>
echo.
endlocal
:END


