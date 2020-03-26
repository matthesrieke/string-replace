FROM alpine

RUN apk add --update bash && rm -rf /var/cache/apk/*

ENV INPUT_SOURCE= \ 
    OUTPUT_OUTPUT=

COPY process.bash /

CMD [ "/process.bash" ]