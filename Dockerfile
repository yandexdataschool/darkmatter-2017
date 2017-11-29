FROM everware/base
USER root

RUN conda install -q -y conda=4.3.30
ADD environment.yml .
RUN conda env update -q --file environment.yml


RUN mkdir -p analysis && wget -q https://cernbox.cern.ch/index.php/s/KdcvaDxND5J9zY2/download -O analysis/data-2016.tar
RUN tar xf analysis/data-2016.tar -C analysis
ADD jupyter_notebook_config.py .jupyter/jupyter_notebook_config.py
ADD build_brick.ipynb analysis

USER jupyter
EXPOSE 8888
