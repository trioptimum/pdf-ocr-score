# pdf-ocr-score

A very basic shell script that I'm using to gauge the quality of already OCRed PDFs. Takes the filename of a PDF as a parameter, and prints the total word count, the count of words not known by aspell, and the percentage of unknown words. A good PDF (exported straight from the original source) likely has an unknown rate of around 5%, while a poorly OCRed scan of questionable quality may be 20% or higher.

Requires pdftotext and aspell.

    chris@totoro Development % ./pdf-ocr-score.sh test-bad.pdf
    Words:    32606
    Typos:    11034
    Typo percentage: 33
    
    chris@totoro pdf-ocr-score % ./pdf-ocr-score.sh test-good.pdf
    Words:    60029
    Typos:     2489
    Typo percentage: 4
