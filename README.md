# General Education Dashboard

This repo contains the code and data to deliver an analytic dashboard for the revised General Education program status at Ferris State University. For the moment, fake data is being used... The live dashboard can be viewed online at [https://weebeasties/shinyapps.io/Dashboard](https://weebeasties/shinyapps.io/Dashboard). The recent <code>shinydashboard</code> package is used to do most of the heavy lifting. This work is released under the MIT license (feel free to fork it and use it as you wish).

## Repo contents

.  
├── Dashboard.Rproj  (the RStudio project file)  
├── LICENSE          (A copy of the MIT license)  
├── README.md        (This file)  
├── app.R            (The R code file for the dashboard)  
├── rsconnect        (Connection information for shinyapps)  
│   └── shinyapps.io  
│       └── weebeasties  
│           └── Dashboard.dcf  
├── sampleData       (CSV data file giving means scores for each competency and semester)  
├── sampleError      (CSV data file giving confidence intervals for each competency and semester) 
├── sampleSize       (CSV data file giving sample size for each competency and semester)  
└── www              (Web support files)  
    ├── boxflame.png (The awful boxflame)  
    └── custom.css   (My style sheet to tweak the dashboard appearance)
