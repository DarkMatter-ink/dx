FROM public.ecr.aws/lts/ubuntu:22.04_stable
WORKDIR /aws
#RUN groupadd awsbox && useradd --no-log-init -r -g awsbox -g sudoers awsbox
RUN apt update
COPY scripts bin

RUN ./bin/install-apt-dependencies.bash
#USER awsbox
#RUN ./bin/install-saml2aws.bash
RUN ./bin/install-aws-cli.bash
