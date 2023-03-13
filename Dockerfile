FROM public.ecr.aws/lts/ubuntu:22.04_stable
WORKDIR /aws

RUN apt update
COPY scripts bin
RUN ./bin/install-apt-dependencies.bash
RUN /aws/bin/install-aws-cli.bash

RUN groupadd awsbox && useradd --no-log-init -d /aws -g awsbox -g sudo awsbox
RUN chown awsbox /aws -R
USER awsbox

#RUN ./bin/install-saml2aws.bash

RUN echo "PATH=${PATH}:/aws/bin" >> ${HOME}/.bashrc