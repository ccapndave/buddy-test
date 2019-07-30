# Another commit
FROM alpine:3.10.1

ARG APP_NAME

RUN apk update && \
    apk add --no-cache \
    bash \
    openssl-dev

ENV REPLACE_OS_VARS=true \
    APP_NAME=${APP_NAME}

#WORKDIR /opt/app

#COPY --from=builder /opt/built .
#COPY /_build/prod/rel/${APP_NAME} .

CMD trap 'exit' INT; /_build/prod/rel/${APP_NAME} foreground
#CMD trap 'exit' INT; /opt/app/bin/${APP_NAME} foreground