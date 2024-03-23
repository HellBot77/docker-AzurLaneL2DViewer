FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://gitgud.io/alg-wiki/azurlanel2dviewer.git && \
    cd azurlanel2dviewer && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/azurlanel2dviewer .
