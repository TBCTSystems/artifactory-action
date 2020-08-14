FROM alpine:3.10

LABEL version="1.2.0"
LABEL repository="https://github.com/TBCTSystems/artifactory-action"
LABEL homepage="https://github.com/TBCTSystems/artifactory-action"
LABEL maintainer="TBCTSystems"
LABEL "com.github.actions.name"="Artifactory jFrog CLI"
LABEL "com.github.actions.description"="Run jFrog CLI commands"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

RUN apk add curl bash
RUN apk add nodejs npm

# TODO: Cache our own version of this in Artifactory and pull it down?
RUN curl -fL https://getcli.jfrog.io | sh \
    && mv ./jfrog /usr/bin/ \
    && chmod +x /usr/bin/jfrog

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash /entrypoint.sh"]
