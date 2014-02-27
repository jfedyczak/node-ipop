# ipop

IP subnet calculator. One can also use it to check if IP is in subnet.

## Install

	npm install ipop

## Usage

### Example

```javascript
var ipop = require('ipop');

// check if IP in subnet
console.log(ipop.ip4incidr('192.168.1.15', '192.168.0.1/24'));
console.log(ipop.ip4incidr('192.168.1.15', '192.168.0.1/16'));
console.log(ipop.ip4incidr('192.168.1.15', '192.168.1.15/32'));

// show subnet info
console.log(ipop.cidr4('87.239.88.1/22'));
```

Output:

```javascript
false
true
true
{ net: '87.239.88.0',
  netmask: '255.255.252.0',
  broadcast: '87.239.91.255',
  low: '87.239.88.1',
  high: '87.239.91.254',
  hosts: 1022 }
```

## Documentation

### ip4incidr(ip, cidr)

`check` if `ip` is in given `cidr`. Returns `boolean`. `cidr` has to be in format `X.X.X.X/X`.

### cidr4(cidr)

`cidr4` returns object with info about given `cidr`:

  - `net`: network address
  - `netmask`: network mask
  - `broadcast`: broadcast address
  - `low`: first usable host address
  - `high`: last usable host address
  - `hosts`: number of usable hosts
