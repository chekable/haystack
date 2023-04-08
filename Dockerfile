# Stage 1: Build and export Elasticsearch index
FROM elasticsearch:7.17.6 AS builder
# copy your index to the Elasticsearch data directory
COPY data /usr/share/elasticsearch/data
# create a snapshot of the index

# Stage 2: Create final image and import Elasticsearch index
FROM elasticsearch:7.17.6
# copy the snapshot to the Elasticsearch data directory
COPY --from=builder /usr/share/elasticsearch/data /usr/share/elasticsearch/ 
