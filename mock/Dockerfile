FROM golang:1.20-alpine

ARG BUILD_DIR=.

ENV WORKSPACE_DIR="/workspace"
ENV PROTOS_DIR="$WORKSPACE_DIR/protos"
ENV GRIPMOCK_GENERATION_DIR="/go/src/grpc/"
ENV GRIPMOCK_MODULE_DIR="/go/src/github.com/tokopedia/gripmock"
ENV STUB_DIRECTORY="/stubs"

RUN apk -U --no-cache add git protobuf bash
RUN go install -v github.com/golang/protobuf/protoc-gen-go@latest
RUN go install -v google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
RUN git clone https://github.com/tokopedia/gripmock.git $GRIPMOCK_MODULE_DIR
WORKDIR $GRIPMOCK_MODULE_DIR/protoc-gen-gripmock
RUN go install -v

COPY lang/.common-protos/google $PROTOS_DIR/google
COPY lang/.common-protos/validate $PROTOS_DIR/validate
COPY protos/strmprivacy/api $PROTOS_DIR/strmprivacy/api

COPY ${BUILD_DIR}/gripmock-protoc.sh $WORKSPACE_DIR
RUN sh $WORKSPACE_DIR/gripmock-protoc.sh
WORKDIR $GRIPMOCK_MODULE_DIR

COPY ${BUILD_DIR}/gripmock.go $GRIPMOCK_MODULE_DIR
COPY ${BUILD_DIR}/go.mod $GRIPMOCK_MODULE_DIR
RUN go mod tidy

RUN mkdir $STUB_DIRECTORY

EXPOSE 4770 4771

ENTRYPOINT ["go", "run", "gripmock.go"]
