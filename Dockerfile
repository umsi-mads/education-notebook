FROM jupyter/datascience-notebook:87210526f381

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.

# The conda-forge channel is already present in the system .condarc file, so there is no need to
# add a channel invocation in any of the next commands.

# Add nbgrader 0.5.5 to the image
# More info at https://nbgrader.readthedocs.io/en/stable/

# First install some missing dependencies
# Note: there is no need to install the "jupyter" metapackage because all the needed
# pieces for nbgrader funtionality are already installed by the bootstraped image.
RUN conda install fuzzywuzzy --yes

# Then install nbgrader with --no-deps because all the neeeded deps are already present.
# Additionally, latest nbgrader release is pinging an old ipython version breaking stuff.
# Note: Eventually, when things get fixed upstream we can remove the previous installation
# of "fuzzywuzzy" and remove the --no-deps flag.
RUN conda install nbgrader --no-deps --yes

# Add RISE 5.4.1 to the mix as well so user can show live slideshows from their notebooks
# More info at https://rise.readthedocs.io
# Note: Installing RISE with --no-deps because all the neeeded deps are already present.
RUN conda install rise --no-deps --yes