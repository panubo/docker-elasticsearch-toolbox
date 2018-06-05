# Backup indexes

Command to backup indexes.

## Environment Configuration

Use `--link <elasticsearch container name>:elasticsearch` to automatically specify the required variables.

Or alternatively specify the individual variables:

- `ELASTICSEARCH_HOST` = IP / hostname of Elasticsearch server.
- `ELASTICSEARCH_PORT` = TCP Port of Elasticsearch service.
- `ELASTICSEARCH_USER`
- `ELASTICSEARCH_PASS`

### Environment Options

- `REPOSITORY_LOCATION` backup repository location
- `RETENTION_COUNT` number of backups to retain (default: 14)

## Example

```
docker run --rm -t -i --link myserver:elasticsearch  docker.io/panubo/elasticsearch-toolbox
```
