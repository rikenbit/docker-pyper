FROM bioconductor/release_sequencing:3.2

LABEL maintainer="Hiroki Danno <redgrapefruit@mac.com>" \
      description="A containerized PypeR" \
      license="GPL"

ADD requirements.txt /tmp

RUN R -e 'source("http://bioconductor.org/biocLite.R"); \
    biocLite("DNABarcodes", ask=FALSE)' && \
    pip install -r /tmp/requirements.txt

CMD ["/bin/bash"]
