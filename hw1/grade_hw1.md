*Bryan Lin*

### Overall Grade: 93/100

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline?

    Yes. `Feb 1, 2018, 2:08 PM PST`.

-   Is the final report in a human readable format html?

    Yes. `html`.

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes. `Rmd`.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how are results produced by just reading the report?

    Yes.

### Correctness and efficiency of solution: 48/50

-   Q1 (10/10)

-   Q2 (20/20)

    \#2. The following implementation (from Dr. Zhou's solution sketch) is fast as it traverses `bim` file only once. The `uniq` command in Linux is useful for counting but takes longer.

    ``` bash
    time awk '
    {chrno[$1]++;} 
    END{ for (c in chrno) print "chr.", c, "has", chrno[c], "SNPs"}'                                   
    /home/m280-data/hw1/merge-geno.bim
    ```

-   Q3 (18/20)

    \#1. `runSim.R`: Use `rcauchy` for the Cauchy distribution.

    \#2. `autoSim_revised.R`: It is a good practice to avoid special characters. Refer to this [article](https://support.apple.com/en-us/HT202808) about cross-platform filename best practices and conventions. Instead of

    ``` r
     oFile <- paste(distr,"n", n, ".txt", sep=",")
    ```

    in line 11, it's better to have

    ``` r
     oFile <- paste(distr,"n", n, ".txt", sep="")
    ```

    \#3. (-2 pts) `tblSim_revised.R`: In line 7, `file.list4` is a list of all text files in current directory, which includes `mendel_ped.txt` and `mendel_snpdef.txt`. Due to these two files, running `tblSim_Revised.R` produces error. In order to avoid this problem, you could have found a pattern only unique to text files of interest. For example, since all the text files generated from `autoSim_revised.R` contains `,` at the end of the name, you can set the pattern to be `pattern=',.txt'`. What's better would be specifying file names as in Dr. Zhou's solution sketch:

    `r  for (dist in distTypes) {    c = c + 1    r = 0 # row    for (n in nVals) {       r = r + 1       oFile = paste("n", n, "dist", dist, ".txt", sep="")      oData = read.table(oFile)      msePrimeAvg[r, c] = oData[1, 2]      mseSamplAvg[r, c] = oData[2, 2]   }  }`

### Usage of Git: 10/10

-   Are branches (`master` and `develop`) correctly set up? Is the hw submission put into the `master` branch?

    Yes.

-   Are there enough commits? Are commit messages clear?

    Yes.

-   Is the hw1 submission tagged?

    Yes.

-   Are the folders (`hw1`, `hw2`, ...) created correctly?

    Yes.

-   Do not put a lot auxillary files into version control.

    Yes.

### Reproducibility: 7/10

-   Are the materials (files and instructions) submitted to the `master` branch sufficient for reproducing all the results? (-3 pts)

    -   In your `tblSim_revised.R`, you have the following path

        ``` r
        file.list4 <- list.files(path = "/home/bryanlin24/biostat-m280-2018-winter", pattern='.txt')
        ```

        which is unique to your own server. Use

        ``` r
        file.list4 <- list.files(path = ".", pattern='.txt')
        ```

        instead so your collaborators can easily run your code.

    -   In your `tblSim_revised.R`, the following command works only if the mirror is set:

        ``` r
        if (!require("pacman")) install.packages("pacman")
        ```

        Make sure your collaborators can easily run your code. You may use something like this instead

        ``` r
        if (!require("pacman")) 
        install.packages("pacman", repos='http://cran.us.r-project.org'))
        ```

        for easier reproducibility.

-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the results?

    Yes.

### Julia code style: 18/20

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters.

-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.).
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. (-2 pts)

    Some violations:
    -   `autoSim_revised.R`: line 11
    -   `runSim_revised.R`: line 58
    -   `tblSim_revised.R`: line 11
        -   Needs a space after the comma.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
