FROM gcc as base

COPY . ./

RUN make clean && make

FROM ubuntu

WORKDIR /usr/src/app

ENV PORT=1883

COPY --from=base ./broker ./

RUN chmod 777 ./broker

EXPOSE $PORT

CMD ./broker ${PORT}