ARG NANOSERVERTAG=1803
FROM mcr.microsoft.com/windows/nanoserver:${NANOSERVERTAG}

WORKDIR /nodejs

ARG NODEJSDIR
COPY ${NODEJSDIR} .

RUN SETX path %path%;C:\nodejs

CMD [ "node" ]
