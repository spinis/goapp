FROM golang:1.15-alpine3.12 AS gobuilder-stage
LABEL "purpose"="multi staging build"
WORKDIR /usr/src/goapp    
COPY goapp.go .
RUN CFG_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /usr/loca/bin/gostart  

FROM scratch AS runtime-stage
COPY --from=gobuilder-stage /usr/loca/bin/gostart /usr/local/bin/gostart
CMD ["/usr/loca/bin/gostart"]
