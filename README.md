# Kontena Log Archiver

Kontena Log Archiver streams logs from Kontena Master MongoDB to Amazon S3
(or compatible) bucket.

## Local Installation to Kontena Master

- copy `systemd/kontena-log-archiver.service` file to master host folder `/etc/systemd/system/`
- write following environment values with correct values to
`/etc/kontena-log-archiver.env`:

```
S3_ACCESS_KEY=
S3_SECRET_KEY=
S3_REGION=
S3_BUCKET=
```

- create capped collection to mongo for tracking log tail:

```
$ docker exec -it kontena-server-mongo mongo --eval 'db.createCollection("container_logs_tail", {capped: true, size: 5242880})' localhost/kontena_server
```

- reload systemd config

```
$ sudo systemctl daemon-reload
```

- start log archiver service

```
$ sudo systemctl start kontena-log-archiver
```

## License

Kontena software is open source, and you can use it for any purpose, personal or commercial. Kontena is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for full license text.
