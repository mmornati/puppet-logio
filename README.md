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


