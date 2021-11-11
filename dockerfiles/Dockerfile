FROM ncivb/nidap:5.0

# Add pipeline files
COPY scripts2 /opt2
RUN chmod 755 /opt2/*

# Add study data
COPY input_data /input_data
RUN chmod -R 755 /input_data

ENTRYPOINT ["/opt2/pipeline_ctl.sh"]
MAINTAINER matthew.g.angel@gmail.com
