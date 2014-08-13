# damon/chess-engine
#
# v 0.1

FROM damon/base

# Install tcputils in order to use mini-inetd
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tcputils

# Download and install the stockfish engine
ADD https://github.com/mcostalba/Stockfish/archive/master.tar.gz /tmp/sf.tar.gz
RUN cd /tmp && tar xfz sf.tar.gz
RUN cd /tmp/Stockfish-master/src && \
    make profile-build ARCH=x86-64 && \
    make install

# Expose the mini-inetd port
EXPOSE 8080

CMD ["/usr/bin/mini-inetd", "8080", "/usr/local/bin/stockfish"]
