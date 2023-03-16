#FROM public.ecr.aws/lts/ubuntu:22.04_stable
FROM ubuntu:22.04
LABEL org.opencontainers.image.description="AWS tools and customizations"
LABEL org.opencontainers.image.source=https://github.com/DarkMatter-Ink/aws-container-image
LABEL org.opencontainers.image.licenses=Apache

# Create the user we plan to "live" in
RUN adduser awsbox --disabled-password

WORKDIR /home/awsbox/

COPY scripts scripts
RUN bash -e ./scripts/install-apt-dependencies.bash
RUN bash -e ./scripts/prepare-user-home.bash /home/awsbox
RUN bash -ex ./scripts/install-node.bash /home/awsbox
RUN bash -e ./scripts/install-aws-cli.bash /home/awsbox
RUN bash -e ./scripts/install-aws-cdk.bash /home/awsbox
RUN bash -e ./scripts/install-aws-sam.bash /home/awsbox

RUN chown awsbox: /home/awsbox -R
USER awsbox

#RUN ./bin/install-saml2aws.bash

