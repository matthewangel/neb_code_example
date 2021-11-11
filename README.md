```

# Pull repository
gh repo clone matthewangel/neb_code_example
cd neb_code_example
```

The example code is in data/SingleCell_Filter_and_QC.Rmd. This is the initial qc and filtering of a scRNA-seq experiment of two libraries, one control and one treated with an immunotheraputic (hetIL15).

The R Markdown file can be run adjusting the appropriate paths, but is indended to be a part of a docker image. To create the docker image, use the following:
```

# Build docker image
docker build -t matthewangel/neb_code_example:1.0 -f Dockerfile .
```

Alternatively, the image can be pulled down from Docker Hub:
```
docker pull matthewangel/neb_code_example:1.0
```

To run the image:
```

workdir=`pwd`; docker run --rm -v ${workdir}/data:/data2 matthewangel/neb_code_example:1.0 --program single_cell
```
This will generate png plots and an html report in data
