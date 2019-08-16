# Elasticsearch Toolbox

**BUILD IS BROKEN**

A collection of Elasticsearch scripts for automating common tasks in a Docker-centric way.

## Documentation

Documentation for each subcommand:

- [backup](commands/backup.md)

## General Usage

Using Docker links to `elasticsearch` container:

```docker run --rm -i -t --link myserver:elasticsearch docker.io/panubo/elasticsearch-toolbox```

This will display the usage information.

```docker run --rm -i -t --link myserver:elasticsearch docker.io/panubo/elasticsearch-toolbox <subcommand>```

To run the subcommand.

## Configuration

Use `--link <elasticsearch container name>:elasticsearch` to automatically specify the required variables.

Or alternatively specify the variables:

- `ELASTICSEARCH_HOST` = IP / hostname of Elasticsearch server.
- `ELASTICSEARCH_PORT` = TCP Port of Elasticsearch service.

Some subcommands require additional environment parameters.

## Status

Usable, however feature incomplete. Work in progress.
