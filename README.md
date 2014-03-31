puppet-logio
============

Module puppet to install automatically a Logio (http://logio.org) project: client and server version.

## Server installation

To install the server you just need to include on your node definition the module ''logio::server''. With an external node yaml classifier, for example, the configuration should be:

```
---
classes:
   logio::server:
``` 

## Harvester (client) installation

To install a client you have the ''logio::harvester'' module. You can simply add this module on your node definition, with the server parameter poiting to your logio server ip address:

```
---
classes:
   logio::harvester:
      logio_server: 127.0.0.1
```

## Add Logs and/or Streams

To add a new log for your servers you can modify the templates ''templates/harvester.conf.erb''. You can simply add a new log file path to the default stream (system) or create a new stream with logs for it.
Here for example a templates including apache logs:

```
exports.config = {
nodeName: "<%= fqdn %>",
  logStreams: {
    system: [
      "/var/log/messages",
      "/var/log/secure"
    ],
    apache: [
      "/var/log/httpd/access_log",
      "/var/log/httpd/error_log",
    ],
  },
  server: {
    host: '<%= logio_server %>',
    port: 28777
  }
}
```
