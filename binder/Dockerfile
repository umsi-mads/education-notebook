FROM umsimads/education-notebook:1017284261a0

# binder requirements to run with a dockerfile
# It must set up a user whose uid is 1000
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
