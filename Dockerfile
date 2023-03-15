#FROM public.ecr.aws/lts/ubuntu:22.04_stable
FROM ubuntu:22.04
LABEL org.opencontainers.image.description AWS tools and customizations

WORKDIR /aws

RUN apt update
COPY scripts bin
RUN bash -e ./bin/install-apt-dependencies.bash
RUN bash -e ./bin/install-aws-cli.bash
RUN bash -e ./bin/install-aws-cdk.bash
RUN bash -e ./bin/install-aws-sam.bash

RUN groupadd awsbox && useradd --no-log-init -d /aws -g awsbox awsbox
RUN chown awsbox /aws -R
USER awsbox

#RUN ./bin/install-saml2aws.bash

RUN echo "PATH=${PATH}:/aws/bin" >> ${HOME}/.bashrc