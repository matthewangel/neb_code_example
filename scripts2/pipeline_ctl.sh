#!/bin/bash

ARGPARSE_DESCRIPTION="Create all files required to generate QC report"
source /opt2/argparse.bash || exit 1
argparse "$@" <<EOF || exit 1
parser.add_argument('--program',required=True, help='program to execute. options: all, single_cell, nanostring')
parser.add_argument('--data_dir',required=False, default='/data2', help='path to the qc folder')
parser.add_argument('--scriptsfolder',required=False, default='/opt2', help='folder where the scripts are... used for debuging without rebuilding the docker')
EOF

program=$PROGRAM
data_dir=$DATA_DIR
scriptsfolder=$SCRIPTSFOLDER

if [[ $program =~ ^(all|nanostring|single_cell)$ ]]; then
	if [ $program == 'nanostring' ] || [ $1 == 'all' ]
	then
		echo "Running Nanostring..."
		echo "Workflow not implemented for example."
	fi

	if [ $program == 'single_cell' ] || [ $1 == 'all' ]
	then
		echo "Running Single Cell..."
		if [ ! -f ${data_dir}/filtered_and_qc.rds ]; then
			Rscript /opt2/sc_filter_and_qc_call.R \
				$data_dir \
				$scriptsfolder
		fi
	fi
else
    printf "Usage: docker run -v <data_dir>:/data2 --rm neb_code_example:1.0 [all|nanostring|single_cell]\n"
fi
