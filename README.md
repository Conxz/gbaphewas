# Global Brain Asymmetry - Phenome Scan Results

- Data of this application was from the paper Biological and Early Life Factors Associated with Global Brain Shape Asymmetry. 
- We used the package PHEnome Scan Analysis Scan (pheWAS), which enables comprehensive phenome scans to be performed across all data fileds in the UK Bioban.
- Links: Scripts on Github [gbaphewas](https://github.com/Conxz/gbaphewas) and application online [gbaphewas](https://conxz.shinyapps.io/gbaphewas/). 
- We would like to acknowledge to [shiny](https://shiny.rstudio.com/), and [PHESANT](https://github.com/MRCIEU/PHESANT) packages.

**Interactive Visualization**
- We visualized our results as D3.js graphs using tools included in the PHESANT package.

**Query Table**
- We corrected for multiple testing using Bonferroni correction, with a significance threshold determined by dividing 0.05 by the number of testes performed (N = 2645), separately for the horizontal and vertical asymmetry measures.

**Usage**
```
1. Get the package by clone or download. 
2. Open the ui.R file using RStudio, and click 'Run App' at the upper right corner. Then, you get it. 
```

You could also directly access these two two links for the Interactive visualization:
- [Horizontal](http://conxz.net/gbaphewas/web/has/index.html)
- [Vertical](http://conxz.net/gbaphewas/web/vas/index.html).


**Contact**
- If you have any questions about this application, please feel free to contact me (Xiangzhen Kong, MPI, Nijmegen) via Email *xiangzhen.kong AT outlok.com* or Twitter [@xiangzhenkong](https://twitter.com/xiangzhenkong) or Github [gbaphewas](https://github.com/Conxz/gbaphewas).
- Updated on Jul. 14, 2019.


