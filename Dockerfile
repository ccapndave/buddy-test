FROM alpine:3.10.1

ARG APP_NAME

RUN apk update && \
    apk add --no-cache \
    bash \
    openssl-dev

ENV REPLACE_OS_VARS=true \
    APP_NAME=${APP_NAME}

WORKDIR /opt/app

#COPY --from=builder /opt/built .

CMD trap 'exit' INT; /opt/app/bin/${APP_NAME} foreground