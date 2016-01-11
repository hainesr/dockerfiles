#
# Dockerfile for document processing.
#
# Tools include LaTeX, pandoc and various other tools.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

FROM jess/pandoc
MAINTAINER Robert Haines <robert.haines@manchester.ac.uk>

RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -qy \
    fontconfig \
    latex-beamer \
    latex-xcolor \
    latexmk \
    texlive-bibtex-extra \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-generic-extra \
    texlive-generic-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-math-extra \
    texlive-science \
    --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /root/work \
  && chmod 755 /root

WORKDIR /root/work

COPY entrypoint.sh /root/
ENTRYPOINT ["/root/entrypoint.sh"]
